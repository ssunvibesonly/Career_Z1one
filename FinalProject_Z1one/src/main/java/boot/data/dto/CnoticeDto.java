package boot.data.dto;

import java.sql.Date;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("CnoticeDto")
public class CnoticeDto {
	   private int cnotice_Num;
	   private int company_Num;
	   private String cnotice_Image;
	   private String cnotice_Name;
	   private String cnotice_Team;
	   private String cnotice_Job;
	   private String cnotice_Area;
	   private String cnotice_Career;
	   private String cnotice_Academic;
	   private String cnotice_Info;
	   private int cnotice_Passmoney;
	   private Timestamp cnotice_Writeday;
	   private int cnotice_Readcount;
	   private Timestamp cnotice_Deadline;
}