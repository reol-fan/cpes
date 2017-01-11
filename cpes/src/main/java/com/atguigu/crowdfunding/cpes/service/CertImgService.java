package com.atguigu.crowdfunding.cpes.service;

import java.util.List;

import com.atguigu.crowdfunding.bean.Datas;
import com.atguigu.crowdfunding.bean.Page;
import com.atguigu.crowdfunding.cpes.bean.AccCertImgCount;
import com.atguigu.crowdfunding.cpes.bean.CertImg;

public interface CertImgService {

	Page<CertImg> getPageCertImgs(Integer start, Integer pageSize);

	void insert(CertImg certImg);

	CertImg selectByPrimary(Integer id);

	void update(CertImg certImg);

	void deletes(Datas data);

	List<CertImg> getAll();

	void insertAccCertImgCount(AccCertImgCount accCertImgCount);

	List<AccCertImgCount> getAllAcis();

	void deleteAccCertImgCount(AccCertImgCount accCertImgCount);

}
