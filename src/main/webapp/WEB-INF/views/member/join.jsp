<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<style>
table, td{
border : 10px solid white;
}
</style>
<div class="container" style="min-height: 780px; margin-top: 20px;">

	<div class="stepwizard">
		<div class="stepwizard-row setup-panel">
			<div class="stepwizard-step">
				<a href="#step-1" type="button" class="btn btn-primary btn-circle">1</a>
				<p>Step 1</p>
			</div>
			<div class="stepwizard-step">
				<a href="#step-2" type="button" class="btn btn-default btn-circle"
					disabled="disabled">2</a>
				<p>Step 2</p>
			</div>


		</div>
	</div>

	<div class="row setup-content" id="step-1">
		<jsp:include page="contract.jsp" flush="true"></jsp:include>
	</div>

	<form id="join" action="join" method="post" name="formm">
		<div class="row setup-content" id="step-2" style="margin-left: 10px;">
			<h3>Step 2 - 회원 가입</h3>
			<input type="hidden" name="reid22" id="reid22" value="abc">
			<table >
				<tr>
					<td><label>User ID</label></td>
					<td><input type="text" class="form-control" id="id" name="id"></td>
					<td><input type="button" value="중복 체크"
						class="dup btn btn-success" onclick="idcheck()"></td>
				</tr>
				<tr>
					<td><label for="password">Password</label></td>
					<td><input type="password" class="form-control" name="pwd"
						placeholder="" required=""></td>
				</tr>

				<tr>
					<td><label for="password">Retype Password</label></td>
					<td><input type="password" class="form-control"
						name="pwdCheck" placeholder="" required=""></td>
				</tr>

				<tr>
					<td><label for="name">Name</label></td>
					<td><input type="text" class="form-control" name="name"
						id="name" placeholder="" required=""></td>
				</tr>

				<tr>
					<td><label for="email">Email</label></td>
					<td><input type="text" class="form-control" name="email"
						id="email" placeholder="" required=""></td>
				</tr>

				<tr>
					<td><label>Zip Code</label></td>
					<td><input type="text" class="form-control" id="zipNum"
						name="zipNum" placeholder="" required=""></td>
					<td><input type="button" value="주소 찾기" class="btn btn-success"
						onclick="post_zip()"></td>
				</tr>

				<tr>
					<td><label for="Address">Address</label></td>
					<td><input type="text" class="form-control" name="addr1"
						id="addr1" placeholder="" required=""></td>
					<td><input type="text" class="form-control" id="addr2"
						name="addr2" placeholder="" required=""></td>
				</tr>

				<tr>
					<td><label for="PhoneNumber">PhoneNumber</label></td>
					<td><input type="text" class="form-control" name="phone"
						id="phone" placeholder="" required=""></td>
				</tr>
				<tr>
					<td colspan="2"></td>
					<td><button id="submitButton" class="btn btn-primary"
							onclick="go_save()">Submit</button></td>
				</tr>
			</table>



		</div>
	</form>
</div>
