<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container">
	<h3 class="text-center">Q&A Board</h3>
	<input type="button" class="btn" value="목록"
		onclick="location.href='adminQnaList.did'">

	<table id="memberList" class="table table-striped">
		<thead>

		</thead>
		<tbody>
			<tr>
				<th>제목</th>
				<td>${qnaVO.subject}${qnaVO.rep}</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><fmt:formatDate value="${qnaVO.indate}" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${qnaVO.content}</td>
			</tr>
		</tbody>
	</table>
	<hr>
	<br>
	<c:choose>
		<c:when test='${qnaVO.rep=="1"}'>

			<form action="adminQnaRepsave.did" method="post">
				<div class="form-group">
					<label for="comment">Comment:</label>
					<textarea class="form-control" name="reply" rows="3" id="reply"></textarea>
					<p style="text-align: right;">
						<input type="hidden" name="qseq" value="${qnaVO.qseq}"> <input
							type="submit" class="btn btn-default" value="저장"> <input
							type="button" class="btn btn-default" value="취소"
							onclick="location.href='adminQnaList.did'">
					</p>

				</div>
			</form>


			<br>
		</c:when>
		<c:otherwise>
			<form action="adminQnaRepsave.did" method="post">
				<div class="form-group">
					<label for="comment">Comment:</label>
					<textarea class="form-control" name="reply" rows="3" id="reply">${qnaVO.reply}</textarea>
					<p style="text-align: right;">
						<input type="hidden" name="qseq" value="${qnaVO.qseq}"> <input
							type="submit" class="btn btn-default" value="수정"> <input
							type="button" class="btn btn-default" value="취소"
							onclick="location.href='adminQnaList.did'">
					</p>
				</div>
			</form>
		</c:otherwise>
	</c:choose>




</div>