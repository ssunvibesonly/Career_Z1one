package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("CnoticeDto")
public class CnoticeDto {
	   private int cnotice_num;
	   private int company_num;
	   private String cnotice_image;
	   private String cnotice_noticename;
	   private String cnotice_career;
	   private String cnotice_skill;
	   private String cnotice_companyname;
	   private int cnotice_grade;
	   private int cnotice_congratulate;
	   private String cnotice_industry1;
	   private String cnotice_industry2;
	   private String cnotice_location;
	   private String cnotice_type;
	   private String cnotice_academy;
	   private String cnotice_deadline;
	   private Timestamp cnotice_writeday;
	   private int cnotice_recommend;
	   private int cnotice_readcount;
	   private int cnotice_pay;
}