package boot.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("CompanyInfoDto")
public class CompanyInfoDto {
	private int cinfo_Num;
	private int company_Num;
	private String cinfo_Ceo;
	private String cinfo_Realpath;
	private String cinfo_Employcnt;
	private String cinfo_Mainbusiness;
	private String cinfo_Homepage;
}
