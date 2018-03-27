package org.aptech.crm.utils;
import java.lang.annotation.Documented;  
import java.lang.annotation.ElementType;  
import java.lang.annotation.Retention;  
import java.lang.annotation.RetentionPolicy;  
import java.lang.annotation.Target;  
  
/** 
 * @author wxy E-mail:wxypersonal@163.com 
 * @date 创建时间:2017年5月25日 下午5:05:22 
 * @version 1.0版本 
 * @company xxx科技公司 
 * @description 描述: 自定义注解: 这个注解是用在某一个成员方法上, 标识这个方法具体是增删改查具体什么内容 
 * */  
@Target(ElementType.METHOD) //表明该注解对成员方法起作用  
@Retention(RetentionPolicy.RUNTIME) //在编译以后仍然起作用  
@Documented //支持JavaDoc文档注释  
public @interface record {  
    String actionType() default "默认动作类型"; //一般有增加, 删除, 修改, 查询  
    String businessLogic() default "默认业务逻辑";  
}  