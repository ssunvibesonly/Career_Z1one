package boot.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("companyInfo")
public class CompanyInfoDto {
	private int cinfo_num;
	private int company_num;
	private String cinfo_ceo;
	private String cinfo_realpath;
	private String cinfo_employcnt;
	private String cinfo_mainbusiness;
	private String cinfo_homepage;
}
