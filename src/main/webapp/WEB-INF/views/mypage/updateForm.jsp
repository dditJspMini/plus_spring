<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
table td{
border: 10px solid white;
}

</style>
<div class="container"
	style="min-height: 780px; max-width: 1040px; margin-left: 5%; margin-top: 20px;">


	<h3>회원정보 수정</h3>

	<c:if test="${param.result==1}">
		<script>
			alert('회원정보 수정 성공');
			location.replace('updateForm.did')
		</script>
	</c:if>
	<c:if test="${param.result==-1}">
		<script>
			alert('회원정보 수정 실패');
			location.replace('updateForm.did')
		</script>
	</c:if>


	<table>
		<form id="join" action="join.did" method="post" name="formm">
			<div class="row setup-content" id="step-2" style="margin-left: 10px;">
				<input type="hidden" name="reid22" id="reid22" value="abc">
				<table>
					<tr>
						<td><label>User ID</label></td>
						<td><input type="text" class="form-control" id="id"
							placeholder="user id" readonly="readonly" required="" name="id"
							value="${loginUser.id }"></td>
					</tr>
					<tr>
						<td><label for="password">Password</label></td>
						<td><input type="password" class="form-control" name="pwd"
							placeholder="" required="" value="${loginUser.pwd }"></td>
					</tr>

					<tr>
						<td><label for="password">Retype Password</label></td>
						<td><input type="password" class="form-control"
							name="pwdCheck" placeholder="" required=""></td>
					</tr>

					<tr>
						<td><label for="name">Name</label></td>
						<td><input type="text" class="form-control" name="name"
							id="name" placeholder="" required="" value="${loginUser.name }"></td>
					</tr>

					<tr>
						<td><label for="email">Email</label></td>
						<td><input type="text" class="form-control" name="email"
							id="email" placeholder="" required="" value="${loginUser.email }"></td>
					</tr>

					<tr>
						<td><label>Zip Code</label></td>
						<td><input type="text" class="form-control" id="zipNum"
							name="zipNum" placeholder="" required=""></td>
						<td><input type="button" value="주소 찾기"
							class="btn  btn-primary" onclick="post_zip()"></td>
					</tr>

					<tr>
						<td><label for="Address">Address</label></td>
						<td><input type="text" class="form-control" name="address"
							id="addr1" placeholder="" required=""
							value="${loginUser.address }"></td>
					</tr>

					<tr>
						<td><label for="PhoneNumber">PhoneNumber</label></td>
						<td><input type="text" class="form-control" name="phone"
							id="phone" placeholder="" required="" value="${loginUser.phone }"></td>
					</tr>
					<tr>
						<td colspan="2"></td>
						<td><button id="submitButton" class="btn  btn-primary"
								onclick="go_update(this.form)">Update</button>
							<button id="submitButton" class="btn  btn-primary"
								onclick="go_delete(this.form)">delete</button>
							<button id="submitButton" class="btn  btn-primary"
								onclick="go_back()">back</button></td>
					</tr>
				</table>



			</div>
		</form>

	</table>
</div>

<script>
	function go_update(form) {
		form.action = "updatemember.did";
		form.method = "post";
		form.submit();
	}
	function go_delete(form) {
		form.action = "deletemember.did";
		form.method = "post";
		form.submit();
	}
	function go_back() {
		history.go(-1);
	};
</script>