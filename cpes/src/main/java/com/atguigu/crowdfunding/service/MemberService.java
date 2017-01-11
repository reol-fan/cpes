package com.atguigu.crowdfunding.service;

import java.util.List;

import com.atguigu.crowdfunding.bean.Member;
import com.atguigu.crowdfunding.bean.MemberCertimgCount;
import com.atguigu.crowdfunding.cpes.bean.CertImg;

public interface MemberService {

	void insert(Member member);

	Member queryMemberByAccout(Member member);

	void updateTrueMember(Member member);

	List<CertImg> queryCertimgByAcctype(Member member);

	void insertCertImgs(List<MemberCertimgCount> accCertShip);

	void updateEmail(Member loginMember);

	Member queryMemberByTask(String piid);

	List<CertImg> queryCertimgByMemberid(String memberid);

	Member queryMemberById(Integer memberid);

	void updateMemberTrue(Member member);

}
