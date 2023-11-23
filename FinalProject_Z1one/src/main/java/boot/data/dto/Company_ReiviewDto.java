package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("Company_ReiviewDto")
public class Company_ReiviewDto {
	private int review_Num;
	private int company_Num;
	private int career_Num;
	private String review_Title;
	private String review_Star;
	private String review_Goodthing;
	private String review_Badthing;
	private String review_Wishced;
	private Timestamp review_Writeday;
}
