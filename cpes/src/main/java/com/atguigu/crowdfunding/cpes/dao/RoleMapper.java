package com.atguigu.crowdfunding.cpes.dao;

import com.atguigu.crowdfunding.bean.Datas;
import com.atguigu.crowdfunding.cpes.bean.Role;
import com.atguigu.crowdfunding.cpes.bean.RolePermission;
import com.atguigu.crowdfunding.cpes.bean.RolePermissionCount;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    Role selectByPrimaryKey(Integer id);

    List<Role> selectAll();

    int updateByPrimaryKey(Role record);

	int getCounts();

	List<Role> getPageRole(@Param("start")Integer start, Integer pageSize);

	List<Role> getPageRole(Map<String, Integer> pmap);

	void deletes(Datas data);

	void assign(Datas datas);

	void batchAssignPermission(@Param("datas")Datas datas,@Param("roleid") Integer roleid);

	void clear(Integer roleid);

	List<RolePermission> queryAssignedPermission(Integer roleid);

	List<RolePermissionCount> queryPermissionCount();

	List<RolePermissionCount> queryPermissionCount(Map<String, Object> map);

	List<Integer> selectAllId();

	void deleteByPermissionid(Integer id);

}