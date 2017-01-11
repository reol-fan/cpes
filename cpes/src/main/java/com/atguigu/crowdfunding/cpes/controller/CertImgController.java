package com.atguigu.crowdfunding.cpes.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.crowdfunding.bean.Datas;
import com.atguigu.crowdfunding.bean.Page;
import com.atguigu.crowdfunding.controller.BaseController;
import com.atguigu.crowdfunding.cpes.bean.AccCertImgCount;
import com.atguigu.crowdfunding.cpes.bean.CertImg;
import com.atguigu.crowdfunding.cpes.service.CertImgService;

@Controller
@RequestMapping("/system/cert")
public class CertImgController extends BaseController {

	@Autowired
	private CertImgService certImgService;
	
	@ResponseBody
	@RequestMapping("/operation")
	public Object operation(AccCertImgCount accCertImgCount,Integer flg){
		begin();
		try {
			if (flg == 1) {
				certImgService.insertAccCertImgCount(accCertImgCount);
			} else {
				certImgService.deleteAccCertImgCount(accCertImgCount);
			}
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("分类失败");
		}
		return end();
	}
	
	//跳转到分类管理页面
	@RequestMapping("/type")
	public String type(Model model){
		//查询所有资质信息
		List<CertImg> cis = certImgService.getAll();
		model.addAttribute("cis",cis);
		//查询出账户和资质信息
		List<AccCertImgCount> acis = certImgService.getAllAcis();
		model.addAttribute("acis", acis);
		return "cert/type";
	}
	
	@RequestMapping("/deletes")
	@ResponseBody
	public Object deletes(Datas data){
		begin();
		try {
			certImgService.deletes(data);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("删除角色信息失败！");
		}
		return end();
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Object update(CertImg certImg){
		begin();
		try {
			certImgService.update(certImg);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("修改角色信息失败！");
		}
		return end();
	}
	
	@RequestMapping("/edit/{id}")
	public String toEdit(@PathVariable("id")Integer id, Model model){
		CertImg certImg = certImgService.selectByPrimary(id);
		model.addAttribute("certImg",certImg);
		return "cert/edit";
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public Object insert(CertImg certImg){
		begin();
		try {
			certImgService.insert(certImg);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			error("保存角色信息失败！");
		}
		return end();
	}
	
	@RequestMapping("/add")
	public Object toadd(){
		return "cert/add";
	}
	
	@ResponseBody
	@RequestMapping("/datas")
	public Object datas(Integer start, @RequestParam("length")Integer pageSize, Integer draw){
		Page<CertImg> certImgs = certImgService.getPageCertImgs(start,pageSize);
		certImgs.setDraw(draw);
		return certImgs;
	}
	
	//跳转到资质管理主页
	@RequestMapping("/index")
	public String index(){
		return "cert/index";
	}
}
