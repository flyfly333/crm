package org.aptech.crm.dao;  
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.aptech.crm.pojo.Permission;
/**
 * 用户dao接口  
 */
public interface PermissionDao extends CommonDao<Permission, Integer> {

	/**
	 * 根据角色获取权限
	 * @param roleId
	 * @return
	 */
	List<Integer> getPersByrid(Integer roleId);

	/**
	 * 删除角色权限
	 * @param roleId
	 */
	void deleteRela(Integer roleId);
	
	void allotPer(@Param("roleId")Integer roleId,@Param("ids")Integer [] perIds);
	
	void deletePerRela(Integer id);
}
