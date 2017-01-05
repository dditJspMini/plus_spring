<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="section">
	<div class="container">
		<c:if test="${!empty param.delMsg }">
			<c:choose>
				<c:when test="${param.delMsg eq 'success'}">
					<script type="text/javascript">
						alert("Success to delete product")
					</script>
				</c:when>
				<c:otherwise>
					<script type="text/javascript">
						alert("Failed to delete product")
					</script>
				</c:otherwise>
			</c:choose>
		</c:if>
		<h3 class="text-center">${delMsg }</h3>
		<h3 class="text-center">PRODUCT LIST</h3>

		<form class="form-inline"
			action="<%=request.getContextPath()%>/admin/adminProductSearch.did"
			id="prodSearch" method="post">
			<div class="form-group">
				<label for="pwd">Product Name :</label> <input type="text"
					class="form-control" id="key" name="key">
			</div>
			<input type="submit" class="btn btn-default" value="Search">
			<button type="button" class="btn btn-default" onclick="addProd_go()">Product
				registration</button>
		</form>


		<table id="productList" class="table table-striped">
			<thead>
				<tr>
					<th >Number</th>
					<th>Product Name</th>
					<th>Cost</th>
					<th>Price</th>
					
					<th>Registration Date</th>
					<th>Use Y/N</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${productListSize<=0}">
						<tr>
							<td width="100%" colspan="7" align="center" height="23">
								There are no registered products.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${productList}" var="productVO">
							<tr>
								<td height="23" align="center">${productVO.pseq}</td>
								<td
									style="text-align: left; padding-left: 50px; padding-right: 0px;">
									<a
									href="adminProductDetail.did?tpage=${tpage}&pseq=${productVO.pseq}">
										${productVO.name} </a>
								</td>
								<td><fmt:formatNumber value="${productVO.price1}" /></td>
								<td><fmt:formatNumber value="${productVO.price2}" /></td>
								<td><fmt:formatDate value="${productVO.indate}" /></td>
								<td><c:choose>
										<c:when test='${productVO.useyn=="y"}'>사용</c:when>
										<c:otherwise>미사용</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="6" style="text-align: center;">${paging}</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

	</div>
</div>

