package com.nonage.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nonage.dao.AddressDAO;
import com.nonage.dto.AddressVO;

@Controller
@RequestMapping("/address")
public class AddressController {
	@Autowired
	private AddressDAO addressDAO;

	public void setAddressDAO(AddressDAO addressDAO) {
		this.addressDAO = addressDAO;
	}

	@RequestMapping("/findZipNum")
	public String findZipNum(String dong,HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String url = "member/findZipNum";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		if (dong != null && dong.trim().equals("") == false) {
			try {
				ArrayList<AddressVO> addressList = addressDAO
						.selectAddressByDong(dong.trim());
				request.setAttribute("addressList", addressList);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return url;
	}
}
