package boot.data.dto;

import java.sql.Timestamp;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("CompanyGaipDto")
public class CompanyGaipDto {
	private int company_num;
	private String company_email;
	private String company_pass;
	private String company_name;
	private String company_primary;
	private String company_secondary;
	private String company_reginum;
	private String company_manager;
	private String company_hp;
	private String company_logo;
	private String company_type;
	private Timestamp company_gaipday;
}
