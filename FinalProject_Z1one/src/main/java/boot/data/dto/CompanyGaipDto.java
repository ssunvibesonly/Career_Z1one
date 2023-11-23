package boot.data.dto;

import java.sql.Timestamp;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("CompanyGaipDto")
public class CompanyGaipDto {
	private int company_Num;
	private String company_Email;
	private String company_Pass;
	private String company_Name;
	private String company_Primary;
	private String company_Secondary;
	private String company_Reginum;
	private String company_Manager;
	private String company_Hp;
	private String company_Logo;
	private String company_Type;
	private Timestamp company_Gaipday;
}
