<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
table td {
border: 10px solid white;
}
</style>
<div class="container" style="margin-top:20px; min-height:780px; max-width: 1040px; margin-left:5%;">
<br><br><br>
	<h3>아이디 찾기</h3>
	<form id="idfind" action="UserIdFind.did" method="post" name="idform">
		<table>
			<tr>
				<td>NAME :</td>
				<td><input type="text" name="name"></td>
				<td></td>
			</tr>
			<tr>
				<td>PHONE :</td>
				<td><input type="text" name="phone"></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="button" value="search" class="btn btn-primary"
					onclick="serchid()"></td>
				<td><c:choose>
						<c:when test="${param.message!=null }">
							<c:choose>
								<c:when test="${param.message!=''}">
									<h3>당신의 아이디는 ${param.message} 입니다.</h3>
								</c:when>
								<c:otherwise>
									<span style="color: red">해당 아이디가 없습니다.</span>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose></td>
			</tr>
		</table>
	</form>


	<h3>비밀번호 찾기</h3>
	<form id="pwdfind" action="UserPwdFind.did" method="post"
		name="pwdform">
		<table>
			<tr>
				<td>NAME :</td>
				<td>&nbsp&nbsp<input type="text" name="name"></td>
				<td></td>
			</tr>
			<tr>
				<td>EMAIL : </td>
				<td>&nbsp&nbsp<input type="text" name="email"></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td>&nbsp&nbsp<input type="button" value="search" class="btn btn-primary"
					onclick="serchpassword()"></td>
				<td><c:choose>
						<c:when test="${param.pwdmessage!=null }">
							<c:choose>
								<c:when test="${param.pwdmessage!=''}">
									<h3>패스워드를 ${param.pwdmessage} 로 보냈습니다.</h3>
								</c:when>
								<c:otherwise>
								<span style="color: red">정보를 잘못 입력하셨습니다.</span>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose></td>
			</tr>
		</table>
	</form>


</div>

<script>
	function serchid() {
		var tname = false;
		var tphone = false;
		if (document.idform.name.value == "") {
			alert('이름을 입력하여 주십시오.');
			document.idform.name.focus();
			return;
		} else {
			tname = true;
		}
		if (document.idform.phone.value == "") {
			alert('폰번호를 입력하여 주십시오.');
			document.idform.phone.focus();
			return;
		} else {
			tphone = true;
		}
		if (tname == true && tphone == true) {
			document.idform.submit();
		}

	}

	function serchpassword() {
		var tname = false;
		var temail = false;
		if (document.pwdform.name.value == "") {
			alert('이름을 입력하여 주십시오.');
			document.idform.name.focus();
			return;
		} else {
			tname = true;
		}
		if (document.pwdform.email.value == "") {
			alert('메일을 입력하여 주십시오.');
			document.idform.email.focus();
			return;
		} else {
			temail = true;
		}
		if (tname == true && temail == true) {
			document.pwdform.submit();
		}
	}
</script>