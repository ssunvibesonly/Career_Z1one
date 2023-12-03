package boot.data.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Member;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import boot.data.dto.UserGaipDto;
import boot.data.inter.SocialInter;
import boot.data.mapper.SocialMapperInter;

@Service
public class SocialService implements SocialInter {

	@Autowired
	SocialMapperInter socialMapperInter;
	@Override
	public String getAccessToekn(String authorize_code) {

		String access_token = "";
		String refresh_token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {

			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();

			sb.append("grant_type=authorization_code");
			sb.append("&client_id=1f310f9b986fd8ff43e39a14a5f9d6db");
			sb.append("&redirect_uri=http://localhost:9000/login/kakao");
			sb.append("&code="+authorize_code);

			bw.write(sb.toString());
			bw.flush();

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode: "+responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while((line=br.readLine())!=null) {
				result += line;
			}
			System.out.println("response body: "+result);

			ObjectMapper objectMapper = new ObjectMapper();

			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>(){
			});
			access_token = jsonMap.get("access_token").toString();
			refresh_token = jsonMap.get("refresh_token").toString();

			System.out.println("access_token: "+access_token);
			System.out.println("refresh_token: "+refresh_token);


			br.close();
			bw.close();
		}catch(IOException e) {
			e.printStackTrace();
		}
		return access_token;
	}
	@Override
	public HashMap<String,Object> getUserInfo(String access_Token) {

		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";

		try {

			URL url = new URL (reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");

			conn.setRequestProperty("Authorization", "Bearer "+access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode: "+responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while((line = br.readLine())!=null) {

				result += line;
			}

			System.out.println("response body: "+result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			String kakao_id = element.getAsJsonObject().get("id").getAsString();
			System.out.println("카카오아이디 "+kakao_id);

			System.out.println("result type: "+result.getClass().getName());

			try {

				UserGaipDto UserGaipDto = new UserGaipDto();

				ObjectMapper objectMapper = new ObjectMapper();
				Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
				});

				System.out.println(jsonMap.get("properties"));

				Map<String, Object> properties = (Map<String, Object>)
					jsonMap.get("properties");
				Map<String, Object> kakao_account = (Map<String, Object>)
					jsonMap.get("kakao_account");

				String kakao_nickname = properties.get("nickname").toString();

				userInfo.put("kakao_nickname", kakao_nickname);
				userInfo.put("kakao_id", kakao_id);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}catch(IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}

	@Override
	public void kakaoLogout(String access_Token) {
		String reqURL = "https://kapi.kakao.com/v1/user/logout";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String result = "";
			String line = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public void kakaoInsert(UserGaipDto userGaipDto) {
		socialMapperInter.kakaoInsert(userGaipDto);
	}

	@Override
	public UserGaipDto findKakao(Map<String, Object> userinfo) {
		System.out.println(userinfo.get("user_name"));
		System.out.println(userinfo.get("user_email"));
		return socialMapperInter.findKakao(userinfo);
	}

	@Override
	public int getSearchKakaoId(String kakao_id) {
		return socialMapperInter.getSearchKakaoId(kakao_id);
	}

}
