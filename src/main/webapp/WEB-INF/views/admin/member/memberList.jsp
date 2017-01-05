<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<title></title>
</head>
<body>

	<div class="container">
		<h3 class="text-center">MEMBER LIST</h3>

		<form class="form-inline" action="memberSearch" id="memberSearch"
			method="post">
			<div class="form-group">
				<label for="pwd">Member Name :</label> <input type="text"
					class="form-control" id="memberName" name="memberName">
			</div>
			<input type="submit" class="btn btn-default" value="Search">
		</form>


		<table id="memberList" class="table table-striped">
			<thead>
				<tr>
					<th>ID(Secession)</th>
					<th>Name</th>
					<th>Email</th>
					<th>Phone</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${memberListSize<=0}">
						<tr>
							<td width="100%" colspan="5" align="center" height="23">
								There are no registered members.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${memberList}" var="memberVO">
							<tr data-toggle="modal" data-target="#myModal">
								<td class="id">${memberVO.id}<c:choose>
										<c:when test='${memberVO.useyn=="y"}'>
											<input type="checkbox" name="useyn" disabled="disabled">
										</c:when>
										<c:otherwise>
											<input type="checkbox" name="useyn" checked="checked"
												disabled="disabled">
										</c:otherwise>
									</c:choose>
								</td>
								<td class="name">${memberVO.name}</td>
								<td class="email">${memberVO.email}</td>
								<td class="phone">${memberVO.phone}</td>
								<td class="pwd" style="display: none">${memberVO.pwd}</td>
								<td class="zipNum" style="display: none">${memberVO.zipNum}</td>
								<td class="address" style="display: none">${memberVO.address}</td>
								<td class="indate" style="display: none">${memberVO.indate}</td>
								<td class="useyn" style="display: none">${memberVO.useyn}</td>

							</tr>
						</c:forEach>
						<tr>
							<td colspan="4" style="text-align: center;">${paging}</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-lg" >
				<div class="modal-content">
					<form action="" id="updateInfoAdmin" name="updateInfoAdmin">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Edit member info</h4>
						</div>
						<div class="modal-body">

							<table>
								<tr>
									<td><label>User ID</label></td>
									<td><input type="text" class="form-control" id="editId"
										name="editId" readonly="readonly"></td>
									<td></td>
								</tr>

								<tr>
									<td><label for="password">Password</label></td>
									<td><input type="text" class="form-control" name="editPwd"
										id="editPwd" placeholder="" required=""></td>
								</tr>



								<tr>
									<td><label for="name">Name</label></td>
									<td><input type="text" class="form-control"
										name="editName" id="editName" placeholder="" required=""></td>
								</tr>

								<tr>
									<td><label for="email">Email</label></td>
									<td><input type="text" class="form-control"
										name="editEmail" id="editEmail" placeholder="" required=""></td>
								</tr>

								<tr>
									<td><label>Zip Code</label></td>
									<td><input type="text" class="form-control"
										id="editZipNum" name="editZipNum" placeholder="" required=""></td>
									<td><input type="button" value="주소찾기"
										class="btn btn-success" onclick="post_zip()"></td>
								</tr>

								<tr>
									<td><label for="editAddr">Address</label></td>
									<td><input type="text" class="form-control"
										name="editAddr" id="editAddr" placeholder="" required=""></td>
								</tr>

								<tr>
									<td><label for="editPhone">PhoneNumber</label></td>
									<td><input type="text" class="form-control"
										name="editPhone" id="editPhone" placeholder="" required=""></td>
								</tr>

								<tr>
									<td><label for="editIndate">Indate</label></td>
									<td><input type="text" class="form-control"
										name="editIndate" id="editIndate" placeholder="" required=""
										readonly="readonly"></td>
								</tr>

								<tr>
									<td><label>Use Y/N</label></td>
									<td><input type="radio" class="form-control"
										name="editUseyn" id="editUseyn" value="y"> Y<br /> <input
										type="radio" class="form-control" name="editUseyn"
										id="editUseyn" value="n"> N<br /></td>

								</tr>
							</table>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								onclick="go_adminUpdate(this.form)">Update</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>

</body>
</html>