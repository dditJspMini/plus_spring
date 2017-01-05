<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="container">
		<h2 class="container-fluid text-center">Product detail view</h2>
		<form name="frm" method="post" enctype="multipart/form-data">
			<table class="table">
				<tbody>
					<tr>
						<th>상품분류</th>
						<td colspan="5">${kind}</td>
					</tr>
					<tr>
						<th align="center">상품 명</th>
						<td colspan="5">${productVO.name}</td>
					</tr>

					<tr>
						<th>원가 [A]</th>
						<td width="60">${productVO.price1}</td>
						<th>판매가 [B]</th>
						<td width="60">${productVO.price2}</td>
						<th>[B-A]</th>
						<td>${productVO.price3}</td>
					</tr>

					<tr>
						<th>상세설명</th>
						<td colspan="5">${productVO.content}</td>
					</tr>

					<tr>
						<th>상품이미지</th>
						<td colspan="5" align="center">
							<!--[7] 상품 이미지를 출력하기 --> <img
							src="<%=request.getContextPath() %>/product_images/${productVO.image}"
							width="200pt" />
						</td>
					</tr>
				</tbody>
			</table>

			<input class="btn btn-default" type="button" value="수정"
				onClick="location.href='adminProductUpdateForm.did?tpage=${tpage}&pseq=${productVO.pseq}'">
			<input class="btn btn-default" type="button" value="취소"
				onClick="go_mov()">

			<c:choose>
				<c:when test='${productVO.useyn=="y"}'>
					<input class="btn btn-danger" type="button" value="삭제"
						data-toggle="modal" data-target="#myModal">
				</c:when>
				<c:otherwise>
					<input class="btn btn-success" type="button" value="등록"
						data-toggle="modal" data-target="#myModal2">
				</c:otherwise>
			</c:choose>


			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Are you sure you want to delete
								this?</h4>
						</div>
						<div class="modal-body">
							<p>Enter this product name to confirm</p>
							<input type="text" id="inputName" name="inputName"
								style="width: 90%"
								onKeyUp="delConfirm(this, '${productVO.name}')">

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" disabled="disabled"
								id="confirmDel"
								onclick="location.href='adminProductDelete.did?key=${productVO.pseq}'">Delete</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>
			
			<div class="modal fade" id="myModal2" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Are you sure you want to register
								this?</h4>
						</div>
						<div class="modal-body">
							<p>Enter this product name to confirm</p>
							<input type="text" id="inputName" name="inputName"
								style="width: 90%"
								onKeyUp="regConfirm(this, '${productVO.name}')">

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-success" disabled="disabled"
								id="confirmReg"
								onclick="location.href='adminProductRegister.did?key=${productVO.pseq}'">Register</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>

		</form>
	</div>
</body>
</html>