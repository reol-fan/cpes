package com.atguigu.crowdfunding.dao;

import com.atguigu.crowdfunding.bean.Member;
import com.atguigu.crowdfunding.bean.Ticket;

import java.util.List;

public interface TicketMapper {
    int insert(Ticket record);

    List<Ticket> selectAll();

	List<Ticket> selectByMember(Member member);

	void updateStatus(Ticket ticket);

	Ticket selectByPIID(String processInstanceId);

	void updateStatusByPiid(Ticket ticket);
}