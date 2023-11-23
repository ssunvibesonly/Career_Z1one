package boot.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("User_CareerDto")
public class User_CareerDto {
	private int careerNum;
	private int userNum;
	private String career_Companyname;
	private String career_Duration;
	private String career_Check;
	private String career_Team;
	private String career_Position;
	private String career_Job;
	private String career_Salary;
	private String career_Story;
}
