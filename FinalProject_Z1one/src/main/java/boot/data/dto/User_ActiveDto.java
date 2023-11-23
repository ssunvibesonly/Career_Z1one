package boot.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("User_ActiveDto")
public class User_ActiveDto {
	private int active_Num;
	private int user_Num;
	private String active_Name;
	private String active_Duration;
	private String active_Awards;
	private String active_Story;
}
