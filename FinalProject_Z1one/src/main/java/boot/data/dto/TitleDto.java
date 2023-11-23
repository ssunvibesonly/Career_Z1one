package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("titledto")
public class TitleDto {

	private int r_num;
	private String r_title;
	private Timestamp deadlineday;
	private int dday;
	private int count;
}
