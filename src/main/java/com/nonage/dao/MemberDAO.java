package com.nonage.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.nonage.dto.MemberVO;

public interface MemberDAO {
	public int confirmID(String userid) throws SQLException;
	public MemberVO getMember(String id) throws SQLException;
	public int insertMember(MemberVO memberVO) throws SQLException;
	
	public ArrayList<MemberVO> listMember(int tpage,String member_name) throws SQLException;
	public MemberVO serchId(String name,String phone) throws SQLException;
	public MemberVO serchPwd(String name,String email) throws SQLException;
	
	public int updateMember(MemberVO memberVO) throws SQLException;
	public int updateMemberAdmin(MemberVO memberVO) throws SQLException;
	public int deleteMember(MemberVO memberVO) throws SQLException;
	public String pageNumber(int parseInt, String key) throws SQLException;
}
