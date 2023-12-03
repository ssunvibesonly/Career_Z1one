package boot.data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("Company_DetailDto")
public class Company_DetailDto {
	private int cdetail_num;
	private int company_num;
	private String cdetail_skill;
	private String cdetail_introduce;
	private String cdetail_work;
	private String cdetail_qualify;
	private String cdetail_treat;
	private String cdetail_procedure;
	private String cdetail_welfare;
	private String cdetail_etc;
}
