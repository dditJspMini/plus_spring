<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>우편 번호 검색</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function result(zipNum, sido, gugun, dong) {
		window.opener.document.getElementById('editZipNum').value =zipNum;
		window.opener.document.getElementById('editAddr').value =sido + " " + gugun + " " + dong;
		//opener.document.formm.zipNum.value = zipNum;
		//opener.document.formm.addr1.value = sido + " " + gugun + " " + dong;
		self.close();
	};
</script>
</head>
<body>
	<div id="popup">
		<h1 style="text-align: center;">우편번호검색</h1>
		<form method=post name=formm action="findZipNum.did">
			<table class="table table-striped">
				<tr>
					<td><label for="dong">동 이름 :</label></td>
					<td><input type="text" class="form-control" id="dong"
						name="dong"></td>
					<td><input type="submit" value="찾기"
						class="submit btn btn-success"></td>
				</tr>
			</table>
		</form>

		<table id="zipcode" class="table table-striped">
			<thead>
				<tr>
					<th>우편번호</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${addressList}" var="addressVO">
					<tr>
						<td>${addressVO.zipNum}</td>
						<td><a href="#"
							onclick="return result('${addressVO.zipNum}'
,'${addressVO.sido}', '${addressVO.gugun}','${addressVO.dong}')">
								${addressVO.sido} ${addressVO.gugun} ${addressVO.dong} </a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>




	</div>
</body>
</html>