package boot.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("User_EducationDto")
public class User_EducationDto {
	private int education_Num;
	private int user_Num;
	private String education_Name;
	private String education_Duration;
	private String education_Check;
	private String education_Grade;
	private String education_Degree;
	private String education_Score;
}
