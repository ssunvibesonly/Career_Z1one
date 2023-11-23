package boot.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("applydto")
public class ApplyDto {

	private int a_idx;
	private int user_num;
	private int r_num;
	private String a_name;
	private int finalpass;
}
