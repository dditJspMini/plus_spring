package com.nonage.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nonage.dao.CartDAO;
import com.nonage.dao.iBatis.CartDAO_iBatis;
import com.nonage.dto.CartVO;
import com.nonage.dto.MemberVO;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartDAO cartDAO;
	
	public void setCartDAO(CartDAO cartDAO) {
		this.cartDAO = cartDAO;
	}
	
	@RequestMapping("/cartDelete")
	public String cartDelete(@RequestParam(value = "cseq", defaultValue = "") String[] cseqArr,
			Model model) {
		String url = "cart/cartList";
		
		for(String cseq : cseqArr) {
			try {
				cartDAO.deleteCart(Integer.parseInt(cseq));
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return url;
	}
	
	@RequestMapping("/cartInsert")
	public String cartInsert(String pseq, String quantity, HttpServletRequest request) {
		String url = "cart/cartList";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			url = "member/login";
		} else {
			CartVO cartVO = new CartVO();
			cartVO.setId(loginUser.getId());
			cartVO.setPseq(Integer.parseInt(pseq));
			cartVO.setQuantity(Integer.parseInt(quantity));
			try {
				cartDAO.insertCart(cartVO);
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		}
		
		return url;
	}
	
	@RequestMapping("/cartList")
	public String cartList(HttpServletRequest request) {
		String url = "cart/cartList";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			url = "member/login";
		} else {
			try {
				ArrayList<CartVO> cartList = cartDAO
						.listCart(loginUser.getId());
				int totalPrice = 0;
				for (CartVO cartVO : cartList) {
					totalPrice += cartVO.getPrice2() * cartVO.getQuantity();
				}
				request.setAttribute("cartList", cartList);
				request.setAttribute("totalPrice", totalPrice);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return url;
	}

}
