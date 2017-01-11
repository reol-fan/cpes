package com.atguigu.crowdfunding.cpes.dao;

import java.util.List;
import java.util.Map;

import com.atguigu.crowdfunding.bean.Datas;
import com.atguigu.crowdfunding.cpes.bean.AccCertImgCount;
import com.atguigu.crowdfunding.cpes.bean.CertImg;

public interface CertImgMapper {

	int getCounts();

	List<CertImg> getPageCertImgs(Map<String, Integer> pmap);

	void insert(CertImg certImg);

	CertImg selectByPrimary(Integer id);

	void update(CertImg certImg);

	void deletes(Datas data);

	List<CertImg> getAll();

	void insertAccCertImgCount(AccCertImgCount accCertImgCount);

	List<AccCertImgCount> getAllAcis();

	void deleteAccCertImgCount(AccCertImgCount accCertImgCount);

}
