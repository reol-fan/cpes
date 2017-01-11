package com.atguigu.crowdfunding.service;

import com.atguigu.crowdfunding.bean.Member;
import com.atguigu.crowdfunding.bean.Ticket;

public interface TicketService {

	void insert(Ticket ticket);

	Ticket queryTicketByMember(Member loginMember);

	void updateStatus(Ticket ticket);

	Ticket queryTicketByTask(String processInstanceId);

	void updateStatusByPiid(Ticket ticket);

}
