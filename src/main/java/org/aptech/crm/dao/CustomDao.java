package org.aptech.crm.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.aptech.crm.pojo.Custom;

public interface CustomDao extends CommonDao<Custom, Integer> {
	
	/**
	 * 按条件查询实体的条数
	 * @param condition 查询条件
	 * @return
	 */
	public Integer getCountByCondition(@Param("condition") Custom condition,@Param("startTime") String startTime,@Param("endTime") String endTime);
	/**
	 * 按条件分页检索数据
	 * @param start 起始条数
	 * @param limit 每页显示的数据条数
	 * @param condition 查询条件
	 * @return
	 */
	public List<Custom> getListByCondition(@Param("start") int start,@Param("limit") int limit,@Param("condition") Custom condition,@Param("column") String column,@Param("orderBy") String orderBy,@Param("startTime") String startTime,@Param("endTime") String endTime);
}
