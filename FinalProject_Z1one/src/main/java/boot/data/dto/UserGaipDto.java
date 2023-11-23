package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ugaipdto")
public class UserGaipDto {
	private String user_name;
	private String user_num;
	private String user_email;
	private String user_pass;
	private Timestamp user_gaipday;
}
