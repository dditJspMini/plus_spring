<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
</style>
<body>
	<div class="w3-container"
		style="max-width: 1040px; margin-left: 5%; padding-left: 0px; padding-right: 0px;">
		<div class="w3-content" id="section" style="max-width: 1140px;">
			<br>
			<c:choose>
				<c:when test="${param.kind == '1'}">
					<div style="width: 100%">
						<img alt="pizza" src="images/product/harness.jpg"
							style="width: 100%; margin-right: 10px; margin-top: 5px;"
							id="img" class="img-rounded">
					</div>
				</c:when>

				<c:when test="${param.kind == '3'}">
					<div style="width: 100%">
						<img alt="pizza" src="images/product/hoodie.jpg"
							style="width: 100%; margin-right: 10px; margin-top: 5px;"
							id="img" class="img-rounded">
					</div>
				</c:when>
			</c:choose>

			<br>
			<div style="overflow: hidden; margin: 0 auto;">
				<c:forEach items="${productKindList }" var="productVO"
					varStatus="status">
					<c:if test="${productVO.useyn=='y'}">
						<div style="float: left; width: 340px">
							<a href="productDetail.did?pseq=${productVO.pseq}"> <img
								id="harness_img" src="product_images/${productVO.image}"
								style="width: 100%; margin: 5px, 5px, 5px, 5px;"
								class="img-rounded" />
							</a>
							<div id="productintro">
								<span id="productname">${productVO.name}</span><br> <b>￦${productVO.price2}</b>
							</div>
							<c:if test="${status.count%3==0}">
								<br>
								<br>
							</c:if>
						</div>
					</c:if>
				</c:forEach>

			</div>
			<div id="bottom-margin"></div>
		</div>

	</div>

</body>