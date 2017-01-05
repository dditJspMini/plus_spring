package com.nonage.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nonage.dto.MemberVO;

public class AdminCheckFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public AdminCheckFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession(false);

		boolean admin = false;

		if (session != null) {
			if (session.getAttribute("loginUser") != null) {
				MemberVO loginMember = (MemberVO)session.getAttribute("loginUser");
				if (loginMember.getId().equals("admin"))
					admin = true;
			}
		}
		if (admin) {
			httpResponse.sendRedirect(httpRequest.getContextPath()
					+ "/admin/adminProductList.did");
		} else {
			httpResponse.sendRedirect("index.jsp");
		}

		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
