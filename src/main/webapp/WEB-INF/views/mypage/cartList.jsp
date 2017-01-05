<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="container" style="margin-top:20px; min-height:780px; max-width: 1040px; margin-left:5%;">
	<%@ include file="sub_menu.jsp"%>
	<h2>Cart List</h2>
	<form name="formm" method="post">
		<c:choose>
			<c:when test="${cartList.size() == 0}">
				<h3 style="color: red; text-align: center;">장바구니가 비었습니다.</h3>
			</c:when>
			<c:otherwise>
				<table id="cartList" class="table table-striped">
					<tr>
						<th>상품명</th>
						<th>수 량</th>
						<th>가 격</th>
						<th>주문일</th>
						<th>선 택</th>
					</tr>

					<c:forEach items="${cartList}" var="cartVO">
						<tr>
							<td><a href="productDetail.did?pseq=${cartVO.pseq}">
									${cartVO.pname}
							</a></td>
							<td style="text-align:center">${cartVO.quantity}</td>
							<td><fmt:formatNumber
									value="${cartVO.price2*cartVO.quantity}" type="currency" /></td>
							<td><fmt:formatDate value="${cartVO.indate}" type="date" /></td>
							<td><input type="checkbox" name="cseq"
								value="${cartVO.cseq}"></td>
						</tr>
					</c:forEach>

					<tr>
						<th colspan="2">총 액</th>
						<th colspan="2"><fmt:formatNumber value="${totalPrice}"
								type="currency" /><br></th>
						<th><a href="#" onclick="go_cart_delete()"><h5>삭제하기</h5></a></th>
					</tr>
				</table>
			</c:otherwise>
		</c:choose>

		<div class="clear"></div>

		<div id="buttons" style="float: right">
			<input type="button" value="쇼핑 계속하기" class="cancel btn btn-primary"
				onclick="location.href='index.did'">
			<c:if test="${cartList.size() != 0}">
				<input type="button" value="주문하기" class="submit btn btn-primary"
					onclick="go_order_insert()">
			</c:if>
		</div>
	</form>
</div>