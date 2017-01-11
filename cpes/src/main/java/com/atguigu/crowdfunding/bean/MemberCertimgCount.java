package com.atguigu.crowdfunding.bean;

public class MemberCertimgCount {
	private Integer id,memberid,ciid;
	private String iconpath;
	
	public MemberCertimgCount() {
		super();
	}
	public MemberCertimgCount(Integer id, Integer memberid, Integer ciid,
			String iconpath) {
		super();
		this.id = id;
		this.memberid = memberid;
		this.ciid = ciid;
		this.iconpath = iconpath;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getMemberid() {
		return memberid;
	}
	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
	}
	public Integer getCiid() {
		return ciid;
	}
	public void setCiid(Integer ciid) {
		this.ciid = ciid;
	}
	public String getIconpath() {
		return iconpath;
	}
	public void setIconpath(String iconpath) {
		this.iconpath = iconpath;
	}
	
}
