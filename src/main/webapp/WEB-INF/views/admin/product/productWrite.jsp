<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="container">
		<h2 class="container-fluid text-center">Product Add</h2>
		<form name="frm" method="post" enctype="multipart/form-data">
			<table class="table">
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
							size="47" maxlength="100"></td>
					</tr>
					<tr>
						<th>원가[A]</th>
						<td width="70"><input type="text" name="price1" size="11"
							></td>
						<th>판매가[B]</th>
						<td width="70"><input type="text" name="price2" size="11"
							></td>
						<th>[B-A]</th>
						<td width="72"><input type="text" name="price3" readonly size="11"></td>
					</tr>

					<tr>
						<th>상세설명</th>
						<td colspan="5"><textarea name="content" rows="8" cols="70"></textarea>
						</td>
					</tr>
					<tr>
						<th>상품이미지</th>
						<td width="343" colspan="5">
							<!--  [2] 파일 업로드를 하기 위한 input 태그는 타입 속성 값을 file로 지정해야 한다.  --> <input
							type="file" name="image">
						</td>
					</tr>
				</tbody>
			</table>
			<input class="btn" type="button" value="등록" onClick="go_save()">
			<input class="btn" type="button" value="취소" onClick="go_mov()">
		</form>
	</div>
</body>
</html>