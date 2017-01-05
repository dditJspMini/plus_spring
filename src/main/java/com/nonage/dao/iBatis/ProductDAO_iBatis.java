package com.nonage.dao.iBatis;

import java.sql.SQLException;
import java.util.ArrayList;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.nonage.dao.ProductDAO;

import com.nonage.dto.ProductVO;

public class ProductDAO_iBatis implements ProductDAO {
	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	@Override
	public ArrayList<ProductVO> listNewProduct() throws SQLException {
		ArrayList<ProductVO> listNewProduct = null;
		listNewProduct = (ArrayList<ProductVO>) client.queryForList(
				"listNewProduct", null);
		return listNewProduct;
	}

	@Override
	public ArrayList<ProductVO> listBestProduct() throws SQLException {
		ArrayList<ProductVO> listBestProduct = null;
		listBestProduct = (ArrayList<ProductVO>) client.queryForList(
				"listBestProduct", null);
		return listBestProduct;
	}

	@Override
	public ProductVO getProduct(String pseq) throws SQLException {
		ProductVO product = new ProductVO();
		product = (ProductVO) client.queryForObject("getProduct", pseq);
		return product;
	}

	@Override
	public ArrayList<ProductVO> listKindProduct(String kind)
			throws SQLException {
		ArrayList<ProductVO> listKindProduct = null;
		listKindProduct = (ArrayList<ProductVO>) client.queryForList(
				"listKindProduct", kind);
		return listKindProduct;
	}

	@Override
	public int totalRecord(String product_name) throws SQLException {
		int total_pages = 0;
		if (product_name.equals("")) {
			product_name = "%";
		}
		total_pages = (Integer) client.queryForObject("totalRecord",product_name);
		return total_pages;
	}

	static int view_rows = 10; // 페이지의 개수
	static int counts = 10; // 한 페이지에 나타낼 상품의 개수
	
	@Override
	public String pageNumber(int tpage, String name) throws SQLException {
		String str = "";

		int total_pages = totalRecord(name);
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
			str += "<a href='adminProductList.did?tpage=1&key="
					+ name + "'>&lt;&lt;</a>&nbsp;&nbsp;";
			str += "<a href='adminProductList.did?tpage="
					+ (start_page - 1);
			str += "&key=<%=product_name%>'>&lt;</a>&nbsp;&nbsp;";
		}

		for (int i = start_page; i <= end_page; i++) {
			if (i == tpage) {
				str += "<font color=red>[" + i + "]&nbsp;&nbsp;</font>";
			} else {
				str += "<a href='adminProductList.did?tpage="
						+ i + "&key=" + name + "'>[" + i + "]</a>&nbsp;&nbsp;";
			}
		}

		if (page_count > end_page) {
			str += "<a href='adminProductList.did?tpage="
					+ (end_page + 1) + "&key=" + name
					+ "'> &gt; </a>&nbsp;&nbsp;";
			str += "<a href='adminProductList.did?tpage="
					+ page_count + "&key=" + name
					+ "'> &gt; &gt; </a>&nbsp;&nbsp;";
		}
		return str;
	}

	@Override
	public ArrayList<ProductVO> listProduct(int tpage, String product_name)
			throws SQLException {
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
		int startRow = -1;
		int endRow = -1;

		if (product_name.equals("")) {
			product_name = "%";
		}

		int totalRecord = totalRecord(product_name);

		startRow = (tpage - 1) * counts ;
		endRow = startRow + counts - 1;
		if (endRow > totalRecord)
			endRow = totalRecord;
		
		productList=(ArrayList<ProductVO>)client.queryForList("listProduct",product_name,startRow,counts);
		return productList;
	}

	@Override
	public int insertProduct(ProductVO product) throws SQLException {
		int result = (Integer)client.update("insertProduct",product);
		return result;
	}

	@Override
	public int updateProduct(ProductVO product) throws SQLException {
		int result = (Integer)client.update("updateProduct",product);
		return result;
	}
	
	// 2016-12-22 jihyun.Park // Implement "delete product"  
	public int deleteProduct(String prodNum) throws SQLException {
		int result = (Integer)client.update("deleteProduct",prodNum);
		return result;
	}
	// Implement "delete product"
	
	public int registerProduct(String prodNum) throws SQLException {
		int result = (Integer)client.update("registerProduct",prodNum);
		return result;
	}
}
