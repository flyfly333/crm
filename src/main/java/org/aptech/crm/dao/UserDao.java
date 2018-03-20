package org.aptech.crm.dao;

import org.aptech.crm.pojo.User;

public interface UserDao extends CommonDao<User, Integer> {
	public User selectByName(String username);
}
