package boot.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("User_EducationDto")
public class User_EducationDto {
	private int education_num;
	private int user_num;
	private String education_name;
	private String education_duration;
	private String education_check;
	private String education_degree;
	private String education_score;
	private String education_major;
}
