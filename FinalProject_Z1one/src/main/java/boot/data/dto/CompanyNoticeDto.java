package boot.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("companynotice")
public class CompanyNoticeDto {
	
	private int cn_idx;
	private String c_ceo;
	private String c_name;
	private String c_saupnum;
	private String c_mail;
	private String c_hp;
	private String c_primary;
	private String c_secondary;
	private String c_main;
	private String c_type;
	private String c_realpath;
	private String c_employcnt;
	private String c_homepage;
	private String c_img;
	
}
