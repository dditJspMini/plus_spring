package com.nonage.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nonage.dao.MemberDAO;
import com.nonage.dao.iBatis.MemberDAO_iBatis;
import com.nonage.dto.MemberRequest;
import com.nonage.dto.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDAO memberDAO;

	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@RequestMapping("/contract")
	public String contract() {
		return "member/contract";
	}

	@RequestMapping("/deletemember")
	public String memberDelete(String id, HttpServletRequest request)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");

		String url = "redirect:" + request.getContextPath() + "/index";
		int result = 0;
		MemberVO deletemember = new MemberVO();
		deletemember.setId(id.trim());
		deletemember.setUseyn("n");
		try {
			result = memberDAO.deleteMember(deletemember);
			url = url + "?deleteresult=" + result;
			session.invalidate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return url;
	}

	@RequestMapping("/idCheckForm")
	public String idCheckForm(String id, Model model) {
		String url = "/member/idcheck";

		int message = -1;
		try {
			message = memberDAO.confirmID(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("message", message);
		model.addAttribute("id", id);

		return url;
	}

	@RequestMapping("/join")
	public String memberJoin(MemberRequest memberReq,
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String url = "member/login";

		HttpSession session = request.getSession();

		return url;
	}

}
