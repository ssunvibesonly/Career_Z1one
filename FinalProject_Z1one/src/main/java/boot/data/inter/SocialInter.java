package boot.data.inter;

import java.util.HashMap;
import java.util.Map;

import boot.data.dto.UserGaipDto;

public interface SocialInter {
	public String getAccessToekn(String authorize_code);
	public HashMap<String,Object> getUserInfo(String access_Token);
	public void kakaoInsert(UserGaipDto userGaipDto);
	public void kakaoLogout(String access_Token); //로그아웃
	public UserGaipDto findKakao(Map<String,Object> userinfo);
	public int getSearchKakaoId(String kakao_id);
}
