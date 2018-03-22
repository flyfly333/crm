package org.aptech.crm.dao;

import java.util.List;

import org.aptech.crm.pojo.Address;

public interface AddressDao extends CommonDao<Address, Integer> {
	/**
	 * 查出所有的省份
	 * @param parentId
	 * @return
	 */
	public List<Address> getProvinceAll(Integer parentId);
	/**
	 * 查出所有的城市
	 * @param id
	 * @return
	 */
	public List<Address> getCityAll(Integer id);
}
