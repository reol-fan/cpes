package com.atguigu.crowdfunding.dao;

import com.atguigu.crowdfunding.bean.Member;
import com.atguigu.crowdfunding.bean.MemberCertimgCount;
import com.atguigu.crowdfunding.cpes.bean.CertImg;

import java.util.List;

public interface MemberMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Member record);

    Member selectByPrimaryKey(Integer id);

    List<Member> selectAll();

    int updateByPrimaryKey(Member record);

	Member queryMemberByAccout(String loginacct);

	List<CertImg> queryCertimgByAcctype(Member member);

	void insertCertImgs(List<MemberCertimgCount> accCertShip);

	void updateEmail(Member member);

	Member queryMemberByTask(String piid);

	List<CertImg> queryCertimgByMemberid(String memberid);

	void updateMemberTrue(Member member);

}