package com.nonage.dao.iBatis;

import java.sql.SQLException;
import java.util.ArrayList;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.nonage.dao.QnaDAO;

import com.nonage.dto.QnaVO;

public class QnaDAO_iBatis implements QnaDAO {

	static int view_rows = 10; // 페이지의 개수
	static int counts = 10; // 한 페이지에 나타낼 상품의 개수

	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	public ArrayList<QnaVO> listQna(String id) throws SQLException {
		ArrayList<QnaVO> qnaList = new ArrayList<QnaVO>();
		qnaList = (ArrayList<QnaVO>) client.queryForList("listQna", id);
		return qnaList;
	}

	public QnaVO getQna(int seq) throws SQLException {
		QnaVO qnaVO = (QnaVO) client.queryForObject("getQna", seq);
		return qnaVO;
	}

	public void insertqna(QnaVO qnaVO, String session_id) throws SQLException {
		qnaVO.setId(session_id);
		client.insert("insertqna", qnaVO);
	}

	/* *
	 * 관리자 모드에서 필요한 메소드
	 */
	public ArrayList<QnaVO> listAllQna(int tpage) throws SQLException {
		ArrayList<QnaVO> qnaList = new ArrayList<QnaVO>();
		// 게시판의 데이터를 가지고 오는 쿼리 rep:1:게시물 2: 답변
		int startRow = -1;
		int endRow = -1;

		int totalRecord = totalQna();

		startRow = (tpage - 1) * counts;
		endRow = startRow + counts - 1;
		if (endRow > totalRecord)
			endRow = totalRecord;

		qnaList = (ArrayList<QnaVO>) client.queryForList("listAllQna", null,
				startRow, counts);
		return qnaList;
	}

	public void updateQna(QnaVO qnaVO) throws SQLException {
		client.update("updateQna", qnaVO);
	}

	public int totalQna() throws SQLException {
		int total_pages = 0;

		total_pages = (Integer) client.queryForObject("totalQna", null);
		return total_pages;
	}

	public String pageNumber(int tpage) throws SQLException {
		String str = "";

		int total_pages = totalQna();
		int page_count = total_pages / counts + 1;

		if (total_pages % counts == 0) {
			page_count--;
		}
		if (tpage < 1) {
			tpage = 1;
		}

		int start_page = tpage - (tpage % view_rows) + 1;
		int end_page = start_page + (counts - 1);

		if (end_page > page_count) {
			end_page = page_count;
		}
		if (start_page > view_rows) {
			str += "<a href='adminQnaList.did?tpage=1'>&lt;&lt;</a>&nbsp;&nbsp;";
			str += "<a href='adminQnaList.did?tpage=" + (start_page - 1);
			str += "&key=<%=product_name%>'>&lt;</a>&nbsp;&nbsp;";
		}

		for (int i = start_page; i <= end_page; i++) {
			if (i == tpage) {
				str += "<font color=red>[" + i + "]&nbsp;&nbsp;</font>";
			} else {
				str += "<a href='adminQnaList.did?tpage=" + i + "'>[" + i
						+ "]</a>&nbsp;&nbsp;";
			}
		}

		if (page_count > end_page) {
			str += "<a href='adminQnaList.did?tpage=" + (end_page + 1)
					+ "'> &gt; </a>&nbsp;&nbsp;";
			str += "<a href='adminQnaList.did?tpage=" + page_count
					+ "'> &gt; &gt; </a>&nbsp;&nbsp;";
		}
		return str;
	}
}
