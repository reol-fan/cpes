package com.atguigu.crowdfunding.cpes.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.crowdfunding.bean.Datas;
import com.atguigu.crowdfunding.bean.Page;
import com.atguigu.crowdfunding.cpes.bean.AccCertImgCount;
import com.atguigu.crowdfunding.cpes.bean.CertImg;
import com.atguigu.crowdfunding.cpes.dao.CertImgMapper;
import com.atguigu.crowdfunding.cpes.service.CertImgService;

@Service
public class CertImgServiceImpl implements CertImgService {

	@Autowired
	private CertImgMapper certImgMapper;

	@Override
	public Page<CertImg> getPageCertImgs(Integer start, Integer pageSize) {
		Page<CertImg> page = new Page<CertImg>();
		Map<String, Integer> pmap = new HashMap<String, Integer>();
		pmap.put("start", start);
		pmap.put("pageSize", pageSize);
		
		//查数量
		int count = certImgMapper.getCounts();
		page.setRecordsTotal(count);
		page.setRecordsFiltered(count);
		//查数据
		List<CertImg> datas = certImgMapper.getPageCertImgs(pmap);
		int index = 1;
		for (CertImg certImg : datas) {
			certImg.setIndex(index++);
		}
		page.setData(datas);
		
		return page;
	}

	@Override
	public void insert(CertImg certImg) {
		certImgMapper.insert(certImg);
	}

	@Override
	public CertImg selectByPrimary(Integer id) {
		return certImgMapper.selectByPrimary(id);
	}

	@Override
	public void update(CertImg certImg) {
		certImgMapper.update(certImg);
	}

	@Override
	public void deletes(Datas data) {
		certImgMapper.deletes(data);
	}

	@Override
	public List<CertImg> getAll() {
		return certImgMapper.getAll();
	}

	@Override
	public void insertAccCertImgCount(AccCertImgCount accCertImgCount) {
		certImgMapper.insertAccCertImgCount(accCertImgCount);
	}

	@Override
	public List<AccCertImgCount> getAllAcis() {
		return certImgMapper.getAllAcis();
	}

	@Override
	public void deleteAccCertImgCount(AccCertImgCount accCertImgCount) {
		certImgMapper.deleteAccCertImgCount(accCertImgCount);
	}
	
	
}
