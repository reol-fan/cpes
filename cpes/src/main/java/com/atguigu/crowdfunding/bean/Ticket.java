package com.atguigu.crowdfunding.bean;

public class Ticket {
    private Integer memberid,id;

    private String piid;

    private String status;

    private String authcode;

    public Ticket(Integer memberid, String piid, String status, String authcode) {
		super();
		this.memberid = memberid;
		this.piid = piid;
		this.status = status;
		this.authcode = authcode;
	}

	public Ticket() {
		super();
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

    public String getPiid() {
        return piid;
    }

    public void setPiid(String piid) {
        this.piid = piid == null ? null : piid.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getAuthcode() {
        return authcode;
    }

    public void setAuthcode(String authcode) {
        this.authcode = authcode == null ? null : authcode.trim();
    }
}