package boot.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("User_CareerDto")
public class User_CareerDto {
	private int career_num;
	private int user_num;
	private String career_companyname;
	private String career_duration;
	private String career_check;
	private String career_team;
	private String career_position;
	private String career_job;
	private String career_salary;
	private String career_story;
}
