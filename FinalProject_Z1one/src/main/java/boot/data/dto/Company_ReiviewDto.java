package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("Company_ReiviewDto")
public class Company_ReiviewDto {
	private int review_num;
	private int cn_idx;
	private String review_title;
	private String review_star;
	private String review_goodthing;
	private String review_badthing;
	private String review_wishced;
	private Timestamp review_writeday;
}
