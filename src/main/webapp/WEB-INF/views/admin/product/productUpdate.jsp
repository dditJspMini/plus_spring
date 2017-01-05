<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<div class="container">
	<h2 class="container-fluid text-center">Edit product</h2>
	<form name="frm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pseq" value="${productVO.pseq}"> <input
			type="hidden" name="code"> <input type="hidden"
			name="nonmakeImg" value="${productVO.image}">
		<table class="table" id="list">
			<tbody>
				<tr>
					<th>상품분류</th>
					<td colspan="5"><select name="kind">
							<option value="1">Dou reversible harness</option>
							<option value="2">Comfort leash</option>
							<option value="3">Hoodie</option>
							<option value="4">Strap Harness</option>
							<option value="5">On Sale</option>
					</select></td>
				</tr>
				<tr>
					<th>상품명</th>
					<td width="343" colspan="5"><input type="text" name="name"
						size="47" maxlength="100" value="${productVO.name}"></td>
				</tr>
				<tr>
					<th>원가[A]</th>
					<td width="70"><input type="text" name="price1" size="11"
						value="${productVO.price1}"></td>
					<th>판매가[B]</th>
					<td width="70"><input type="text" name="price2" size="11"
						onBlur="go_ab()" value="${productVO.price2}"></td>
					<th>[B-A]</th>
					<td width="72"><input type="text" name="price3" size="11"
						readonly></td>
				</tr>
				<tr>
					<th>베스트상품</th>
					<td><c:choose>
							<c:when test='${productVO.bestyn=="y"}'>
								<input type="checkbox" name="bestyn" value="y" checked="checked">
							</c:when>
							<c:otherwise>
								<input type="checkbox" name="bestyn" value="n">
							</c:otherwise>
						</c:choose></td>
					<th>사용유무</th>
					<td><c:choose>
							<c:when test='${productVO.useyn=="y"}'>
								<input type="checkbox" name="useyn" value="y" checked="checked">
							</c:when>
							<c:otherwise>
								<input type="checkbox" name="useyn" value="n">
							</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<th>상세설명</th>
					<td colspan="5"><textarea name="content" rows="8" cols="70">${productVO.content}</textarea>
					</td>
				</tr>
				<tr>
					<th>상품이미지</th>
					<td colspan="5"><img
						src="<c:url value="/product_images"/>/${productVO.image}"
						width="200pt" /> <br> <input type="file" name="image">
					</td>
				</tr>
			</tbody>
		</table>
		<input class="btn" type="button" value="수정"
			onClick="go_mod_save('${tpage}','${productVO.pseq}')"> <input
			class="btn" type="button" value="취소" onClick="go_mov()">
	</form>
</div>
</body>
</html>