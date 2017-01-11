package com.atguigu.crowdfunding.cpes.dao;

import com.atguigu.crowdfunding.bean.Datas;
import com.atguigu.crowdfunding.cpes.bean.Permission;
import com.atguigu.crowdfunding.cpes.bean.User;
import com.atguigu.crowdfunding.cpes.bean.UserRoleCount;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    User selectByPrimaryKey(Integer id);

    List<User> selectAll();

    int updateByPrimaryKey(User record);

	User selectUserByAcc(String loginacct);

	int getCount();

	List<User> getUserPage(Map<String, Integer> paramMap);

	List<UserRoleCount> queryRoleConnection(Map<String, Object> map);

	void deleteByPrimaryKeys(Datas datas);

	List<Integer> selectUserRoleById(Integer userid);

	void addUserRoleRelation(HashMap<String, Object> paramMap);

	void remove(Integer userid);

	void removeUserRoleRelation(HashMap<String, Object> paramMap);

	List<Permission> getPermissions(Integer userid);
}