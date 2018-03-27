package org.aptech.crm.realms;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.aptech.crm.dao.PermissionDao;
import org.aptech.crm.dao.UserDao;
import org.aptech.crm.pojo.Permission;
import org.aptech.crm.pojo.User;
import org.aspectj.weaver.ast.And;
/**
 * 自定义Realm
 * @author Miao  Long
 *
 */
public class CustomRealm extends AuthorizingRealm {
	
	
	private UserDao userDao;
	
	private PermissionDao permissionDao;
	 
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public void setPermissionDao(PermissionDao permissionDao) {
		this.permissionDao = permissionDao;
	}

	/**
	 *授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principal) {
		User user = (User)principal.getPrimaryPrincipal();
		List<Permission> pers = permissionDao.getPersByUserId(user.getId());
		user.setPermissions(pers);
		List<String> list = new ArrayList<>();
		
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		for (Permission permission : pers) {
			if (permission.getPercode() != null && permission.getPercode() != "") {
				info.addStringPermission(permission.getPercode());
			}
		} 
		return info;
	}
	/**
	 * 认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		System.out.println("认证");
		String username = (String)token.getPrincipal();
		User user = userDao.selectByName(username);
		if (user == null) {
			return null;
		}
		System.out.println(user);
		//查询用户的权限(menu)
		return new SimpleAuthenticationInfo(user, user.getPassword(), getName());
	}

}
