package boot.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("User_ActiveDto")
public class User_ActiveDto {
	private int active_num;
	private int user_num;
	private String active_name;
	private String active_duration;
	private String active_awards;
	private String active_story;
}
