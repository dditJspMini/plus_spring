<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>아이디 중복 체크</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function idok() {
		var id = document.getElementById('id');
		var reid = document.getElementById('reid');
		id.value = "${id}";
		window.opener.document.getElementById('reid22').value = "${id}";
		self.close();
	}
</script>
</head>
<body>
	<div class="container">
		<h1>ID 중복확인</h1>

		<form method=post name=formm style="margin-right: 0"
			action="idCheckForm.did">

			<table >
				<tr>
					<td><label for="id">User ID :</label></td>
					<td><input style="width: 100px;" type="text"
						class="form-control" id="id" name="id"></td>
					<td><input type=submit value="검색"
						class="submit btn btn-success"></td>
				</tr>
				<tr>
					<td colspan="3"><c:if test="${message == 1}">
							<script type="text/javascript">
								opener.document.formm.id.value = "";
							</script>
        ${id}는 이미 사용중인 아이디입니다.
      </c:if></td>
				</tr>
				<tr>
					<td colspan="3"><c:if test="${message==-1}">
        ${id}는 사용 가능한 ID입니다.
        <input type="button" value="사용" class="cancel btn btn-primary" onclick="idok()">
						</c:if></td>
				</tr>
			</table>

		</form>
	</div>





</body>
</html>