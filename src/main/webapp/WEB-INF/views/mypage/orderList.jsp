<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container" style="min-height:780px; max-width: 1040px; margin-left:5%; margin-top:20px;">
<%@ include file="sub_menu.jsp"%>

	<h2>Order List</h2>
	<form name="formm" method="post">
		<table id="cartList" class="table table-striped">
			<tr>
				<th>상품명</th>
				<th>수 량</th>
				<th>가 격</th>
				<th>주문일</th>
				<th>진행 상태</th>
			</tr>
			<c:forEach items="${orderList}" var="orderVO">
				<tr>
					<td><a href="productDetail.did?pseq=${cartVO.pseq}">
							${orderVO.pname}
					</a></td>
					<td>${orderVO.quantity}</td>
					<td><fmt:formatNumber
							value="${orderVO.price2*orderVO.quantity}" type="currency" /></td>
					<td><fmt:formatDate value="${orderVO.indate}" type="date" /></td>
					<td>처리 진행 중</td>
				</tr>
			</c:forEach>
			<tr>
				<th colspan="2">총 액</th>
				<th colspan="2"><fmt:formatNumber value="${totalPrice}"
						type="currency" /><br></th>
				<th>주문 처리가 완료되었습니다.</th>
			</tr>
		</table>

		<div class="clear"></div>
		<div id="buttons" style="float: right">
			<input type="button" class="cancel btn btn-primary" value="쇼핑 계속하기" class="cancel"
				onclick="location.href='index.did'">
		</div>
	</form>
</div>
