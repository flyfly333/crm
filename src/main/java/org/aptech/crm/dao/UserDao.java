package org.aptech.crm.dao;

import org.apache.ibatis.annotations.Param;
import org.aptech.crm.pojo.User;

public interface UserDao extends CommonDao<User, Integer> {
      
	public User selectByName(String username);
	 
	void addUserRole(@Param("userId")Integer userId,@Param("rids")Integer [] rids);
	 
	void deleteRela(@Param("userId")Integer userId);
}
