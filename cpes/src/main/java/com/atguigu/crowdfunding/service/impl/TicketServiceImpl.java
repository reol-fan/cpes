package com.atguigu.crowdfunding.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.crowdfunding.bean.Member;
import com.atguigu.crowdfunding.bean.Ticket;
import com.atguigu.crowdfunding.dao.TicketMapper;
import com.atguigu.crowdfunding.service.TicketService;

@Service
public class TicketServiceImpl implements TicketService {

	@Autowired
	private TicketMapper ticketMapper;

	@Override
	public void insert(Ticket ticket) {
		ticketMapper.insert(ticket);
	}

	@Override
	public Ticket queryTicketByMember(Member loginMember) {
		return ticketMapper.selectByMember(loginMember).get(0);
	}

	@Override
	public void updateStatus(Ticket ticket) {
		ticketMapper.updateStatus(ticket);
	}

	@Override
	public Ticket queryTicketByTask(String processInstanceId) {
		return ticketMapper.selectByPIID(processInstanceId);
	}

	@Override
	public void updateStatusByPiid(Ticket ticket) {
		ticketMapper.updateStatusByPiid(ticket);
	}
}
