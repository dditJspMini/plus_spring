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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.nonage.dao.MemberDAO;
import com.nonage.dao.iBatis.MemberDAO_iBatis;
import com.nonage.dto.MemberRequest;
import com.nonage.dto.MemberVO;

@Controller
@SessionAttributes("loginUser")
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

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String memberJoin(MemberRequest memberReq,
			HttpServletRequest request, HttpServletResponse response,
			String id, Model model, HttpSession session) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String url = "redirect:/index";

		MemberVO memberVO = memberReq.toMemberVO();

		try {
			memberDAO.insertMember(memberVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("joinId", id);
		// model.addAttribute("joinId", id);

		return url;
	}

	@RequestMapping("/joinForm")
	public String memberJoinForm() {

		String url = "/member/join";

		return url;
	}

	@RequestMapping("/loginForm")
	public String memberLoginForm() {

		String url = "/member/login";

		return url;
	}

	@RequestMapping("/login")
	public String memberLogin(String id, String pwd, Model model, HttpSession session) {
		String url = "member/login_fail.jsp";
		String useyn = "y";

		MemberVO memberVO = null;
		try {
			memberVO = memberDAO.getMember(id);
			if (memberVO != null) {
				useyn = memberVO.getUseyn();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (memberVO != null) {
			if (memberVO.getUseyn().equals("n")) {
				url = url + "?useyn=n";
			} else {
				if (isAdminUser(id)) { // Admin
					if (memberVO.getPwd().equals(pwd)) {
						//session.setAttribute("loginUser", memberVO);
						model.addAttribute("loginUser", memberVO);
						url = "redirect:/admin/adminProductList";
					}
				} else { // 일반 User

					if (memberVO.getPwd().equals(pwd)) {
						model.addAttribute("loginUser", memberVO);
						//session.setAttribute("loginUser", memberVO);
						// String str =
						// session.getAttribute("loginDir").toString();
						if (session.getAttribute("loginDir") != null) {
							if (session.getAttribute("loginDir").toString()
									.equals("prodDtail")) {
								String pseq = session.getAttribute("prodNum")
										.toString();
								url = "redirect:/productDetail?pseq=" + pseq;
								// session.setAttribute("loginDir3", "1");
								session.removeAttribute("loginDir");
								session.removeAttribute("prodNum");
								// session.invalidate();
							} else {
								url = "redirect:/index?login=1";
							}
						} else {
							url = "redirect:/index?login=1";
						}
					}
				}
			}
		}
		return url;

	}

	private boolean isAdminUser(String id) {
		return id.equals("admin");
	}

}
