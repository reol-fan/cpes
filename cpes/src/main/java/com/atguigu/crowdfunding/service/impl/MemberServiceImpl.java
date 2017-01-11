package com.atguigu.crowdfunding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.crowdfunding.bean.Member;
import com.atguigu.crowdfunding.bean.MemberCertimgCount;
import com.atguigu.crowdfunding.cpes.bean.CertImg;
import com.atguigu.crowdfunding.dao.MemberMapper;
import com.atguigu.crowdfunding.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public void insert(Member member) {
		memberMapper.insert(member);
	}

	@Override
	public Member queryMemberByAccout(Member member) {
		return memberMapper.queryMemberByAccout(member.getLoginacct());
	}

	@Override
	public void updateTrueMember(Member member) {
		memberMapper.updateByPrimaryKey(member);
	}

	@Override
	public List<CertImg> queryCertimgByAcctype(Member member) {
		return memberMapper.queryCertimgByAcctype(member);
	}

	@Override
	public void insertCertImgs(List<MemberCertimgCount> accCertShip) {
		memberMapper.insertCertImgs(accCertShip);
	}

	@Override
	public void updateEmail(Member loginMember) {
		memberMapper.updateEmail(loginMember);
	}

	@Override
	public Member queryMemberByTask(String piid) {
		return memberMapper.queryMemberByTask(piid);
	}

	@Override
	public List<CertImg> queryCertimgByMemberid(String memberid) {
		return memberMapper.queryCertimgByMemberid(memberid);
	}

	@Override
	public Member queryMemberById(Integer memberid) {
		return memberMapper.selectByPrimaryKey(memberid);
	}

	@Override
	public void updateMemberTrue(Member member) {
		memberMapper.updateMemberTrue(member);
	}
	
}
