package com.nonage.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.nonage.dao.MemberDAO;
import com.nonage.dao.ProductDAO;
import com.nonage.dao.iBatis.MemberDAO_iBatis;
import com.nonage.dto.MemberRequest;
import com.nonage.dto.MemberVO;
import com.nonage.dto.ProductVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private ProductDAO productDAO;

	public void setProductDAO(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}

	@RequestMapping("/adminProductList")
	public String adminProductList(String key, String tpage, Model model) {

		String url = "admin/product/productList";

		if (key == null) {
			key = "";
		}
		if (tpage == null) {
			tpage = "1"; // 현재 페이지 (default 1)
		} else if (tpage.equals("")) {
			tpage = "1";
		}

		model.addAttribute("key", key);
		model.addAttribute("tpage", tpage);
		
		ArrayList<ProductVO> productList=null;
	    String paging=null;
		try {
			productList=productDAO.listProduct(Integer.parseInt(tpage), key);
			paging = productDAO.pageNumber(Integer.parseInt(tpage), key);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("productList", productList);
		int n =productList.size();
		model.addAttribute("productListSize",n);
		model.addAttribute("paging", paging);
		
		return url;
	}

}
