package boot.data.dto;

import java.security.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("recruitdto")
public class RecruitDto {

	private int r_num;
	private int c_code;
	private String r_title;
	private String r_level;
	private int r_step;
	private Timestamp deadlineday;
}
