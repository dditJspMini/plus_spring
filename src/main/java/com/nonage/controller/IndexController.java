package com.nonage.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nonage.dao.ProductDAO;
import com.nonage.dto.ProductVO;

@Controller
public class IndexController {
	
	@Autowired
	private ProductDAO productDAO;

	public void setProductDAO(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}

	@RequestMapping("/index")
	public String index(Model model) {
		String url = "/index";

		ArrayList<ProductVO> newProductList = null;
		ArrayList<ProductVO> bestProductList = null;
		try {
			newProductList = productDAO.listNewProduct();
			bestProductList = productDAO.listBestProduct();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		model.addAttribute("newProductList", newProductList);
		model.addAttribute("bestProductList", bestProductList);

		return url;
	}
}
