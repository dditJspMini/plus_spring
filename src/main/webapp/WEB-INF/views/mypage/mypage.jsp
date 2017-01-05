<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="container" style="min-height:780px; max-width: 1040px; margin-left:5%; margin-top:20px;">
	<%@ include file="sub_menu.jsp"%>

	<h2>My Page(${title})</h2>
	<form name="formm" method="post">
		<table id="cartList" class="table table-striped">
			<tr>
				<th>주문일자</th>
				<th>주문번호</th>
				<th>상품명</th>
				<th>결제 금액</th>
				<th>주문 상세</th>
			</tr>
			<c:forEach items="${orderList}" var="orderVO">
				<tr>
					<td><fmt:formatDate value="${orderVO.indate}" type="date" /></td>
					<td>${orderVO.oseq}</td>
					<td>${orderVO.pname}</td>
					<td><fmt:formatNumber value="${orderVO.price2}"
							type="currency" /></td>
					<td><a href="orderDetail.did?oseq=${orderVO.oseq}"> 조회 </a></td>
				</tr>
			</c:forEach>
		</table>

		<div class="clear"></div>
		<div id="buttons" style="float: right">
			<input type="button" value="쇼핑 계속하기" class="cancel btn btn-primary"
				onclick="location.href='index.did'">
		</div>
	</form>
</div>
