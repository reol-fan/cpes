package com.atguigu.crowdfunding.bean;

import java.util.List;

import com.atguigu.crowdfunding.cpes.bean.User;

public class Datas {

	private List<Integer> ids;
	
	private List<User> users;
	
	private List<String> pids;

	public List<String> getPids() {
		return pids;
	}

	public void setPids(List<String> pids) {
		this.pids = pids;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public List<Integer> getIds() {
		return ids;
	}

	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}

}
