package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("User_ApplyDto")
public class User_ApplyDto {
   private int apply_Num;
   private int user_Num;
   private String apply_Name;
   private String apply_Photo;
   private String apply_Hp;
   private String apply_Gender;
   private String apply_Addr;
   private String apply_Birth;
   private String apply_Salary;
   private String apply_region;
   private String apply_primary;
   private String apply_secondary;
   private String apply_newcomer;
   private Timestamp apply_Writeday;
}