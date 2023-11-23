package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("Company_DetailDto")
public class Company_DetailDto {
	private int cdetail_Num;
	private int company_Num;
	private String cdetail_Name;
	private String cdetail_Category;
	private String cdetail_Story;
	private Timestamp cdetail_Writeday;
}
