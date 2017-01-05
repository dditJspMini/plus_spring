package com.nonage.dto;

public class MemberRequest {
	private String id;
	private String email;
	private String pwd;
	private String name;
	private String zipNum;
	private String addr1;
	private String addr2;
	private String phone;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getZipNum() {
		return zipNum;
	}

	public void setZipNum(String zipNum) {
		this.zipNum = zipNum;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	// 
	public MemberVO toMemberVO() {
		MemberVO memberVO = new MemberVO();
		
		memberVO.setId(this.id);
		memberVO.setEmail(this.email);
		memberVO.setPwd(this.pwd);
		memberVO.setName(this.name);
		memberVO.setZipNum(this.zipNum);
		memberVO.setAddress(this.addr1+this.addr2);
		memberVO.setPhone(this.phone);
		
		return memberVO;
	}
}
