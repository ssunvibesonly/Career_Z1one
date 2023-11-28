package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("User_ApplyDto")
public class User_ApplyDto {
   private int apply_num;
   private String user_num;
   private String apply_name;
   private String apply_photo;
   private String apply_hp;
   private String apply_gender;
   private String apply_addr;
   private String apply_birth;
   private String apply_salary;
   private String apply_region;
   private String apply_primary;
   private String apply_secondary;
   private String apply_newcomer;
   private Timestamp apply_writeday;
}