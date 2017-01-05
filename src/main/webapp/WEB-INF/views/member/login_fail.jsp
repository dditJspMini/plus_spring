<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 

<c:choose>
<c:when test="${param.useyn eq 'n' }">
		<script>
		alert('탈퇴한 회원 입니다 관리자에게 문의해 주세요');
		history.go(-1);
		</script>
</c:when>
<c:otherwise>
	<script>
	  alert("로그인 실패");
	  history.go(-1);
	</script>
</c:otherwise>
	
</c:choose>
