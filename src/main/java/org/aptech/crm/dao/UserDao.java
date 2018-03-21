package org.aptech.crm.dao;

import org.apache.ibatis.annotations.Param;
import org.aptech.crm.pojo.User;

public interface UserDao extends CommonDao<User, Integer> {
 
	 
	void addUserRole(@Param("userId")Integer userId,@Param("rids")Integer [] rids);
	 
	void deleteRela(@Param("userId")Integer userId); 
	
	public User selectByName(String username);
}
