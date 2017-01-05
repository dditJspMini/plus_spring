<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link href="<%=request.getContextPath() %>/css/shopping.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/modal.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/join.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/footer-distributed-with-address-and-phones.css"
	rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/cookie.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/main.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<script type="text/javascript" src="<%=request.getContextPath() %>/js/products.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/members87.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/mypages.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/join.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/custom.js"></script>
<style>
.bodywrap {
	padding-top: 83px;
	min-height: 800px;
}
</style>
<title>프블</title>
</head>
<body class="bodywrap">
	<header id="wrap">
		<div class="main-navigation navbar-fixed-top">
			<nav class="navbar navbar-default" style="padding-top: 4px;"
				id="navbar-default">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#myNavbar">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="<%=request.getContextPath() %>/index"
							style="padding-top: 10px;"><img src="<%=request.getContextPath() %>/image/logo.png"></a>
					</div>
					<div class="collapse navbar-collapse" id="myNavbar"
						style="padding-top: 8px;">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="catagory.did?kind=1" id="menu">HARNESSES</a></li>
							<li><a href="catagory.did?kind=2" id="menu">LEASH</a></li>
							<li><a href="catagory.did?kind=3" id="menu">HOODIE</a></li>
							<li><a href="catagory.did?kind=4" id="menu">STRAP</a></li>
							<li><a href="catagory.did?kind=5" id="menu">ON SALE</a></li>
							<li>&nbsp&nbsp</li>
							<c:choose>
								<c:when test="${empty loginUser }">
									<li><a href="javascript:popupOpen();" id="menu1"><span
											class="glyphicon glyphicon-log-in" data-toggle="tooltip"
											data-original-title="login" id="menu"></span></a></li>

									<li><a href="member/joinForm" id="menu1"><span
											class="glyphicon glyphicon-plus" data-toggle="tooltip"
											data-original-title="join" id="menu"></span></a></li>

									<li><a href="findForm.did" id="menu1"><span
											class="glyphicon glyphicon-search" data-toggle="tooltip"
											data-original-title="Search" id="menu"></span></a></li>


								</c:when>
								<c:otherwise>

									<li><a href="qnaList.did" id="menu1"><span
											class="glyphicon glyphicon-question-sign"
											data-toggle="tooltip" data-original-title="Q&A" id="menu"></span></a></li>
									<li><a href="mypage.did" id="menu1"><span
											class="glyphicon glyphicon-user" data-toggle="tooltip"
											data-original-title="My Acount" id="menu"></span></a></li>
									<li><a href="cartList.did" id="menu1"><span
											class="glyphicon glyphicon-shopping-cart"
											data-toggle="tooltip" data-original-title="Cart" id="menu"></span></a></li>
									<li><a href="logout.did" id="menu1"><span
											class="glyphicon glyphicon-log-out" style="color: #600017"
											;
											data-toggle="tooltip"
											data-original-title="Logout" id="menu"></span></a></li>
								</c:otherwise>
							</c:choose>
						</ul>

					</div>
				</div>
			</nav>
		</div>
	</header>




	<decorator:body />

	<div id="rightSide">
		<div id="right_zzim">
			<div class="recTit">
				최근본상품 <span id=recentCnt></span>
			</div>
			<div id="ul"></div>
			<!-- 본 상품이 뿌려질 부분  -->
			<div id="paging">
				<a class="btn_prev" style="cursor: pointer">이전</a> <span
					id="currentPage"></span> <span id="totalPageCount"></span> <a
					class="btn_next" style="cursor: pointer">다음</a>
			</div>
		</div>
	</div>

	<footer class="footer-distributed" style="padding-top:20px; padding-bottom:10px;">

		<div class="w3-container" style="max-width: 1140px; margin:0px auto; padding-left:0px; padding-right:0px;">
			<div class="footer-left" style="margin-right:45px;">

				<h3>
					Frenchie<span>BullDog</span>
				</h3>

				<p class="footer-links">
					<a href="index.did">Home</a> · <a
						href="/mini_project/catagory.did?kind=1">Harness</a> · <a href="#">leash</a>
					· <a href="#">Hoodie</a> · <a href="#">Strap</a> · <a href="#">On
						Sale</a>
				</p>

				<p class="footer-company-name">대덕인재개발원 202호 &copy; 2016</p>
			</div>

			<div class="footer-center">

				<div>
					<i class="fa fa-map-marker"></i>
					<p>
						<span>대전광역시 중구 중앙로</span>76 영민빌딩 2층 202호
					</p>
				</div>

				<div>
					<i class="fa fa-phone"></i>
					<p>010-0000-0000</p>
				</div>

				<div>
					<i class="fa fa-envelope"></i>
					<p>
						<a href="mailto:ddit@ddit.or.kr">ddit@ddit.or.kr</a>
					</p>
				</div>

			</div>

			<div class="footer-right">

				<p class="footer-company-about">
					<span>About FrenchieBullDog</span> 이상용 박지현 백승부 여준영
				</p>


			</div>
		</div>
	</footer>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip({
			placement : 'bottom'
		});
	});

	$(document).ready(function() {
		$(document).scroll(function() {
			var top = $(this).scrollTop();
			if (top < 150) {
				var dif = 1 - top / 450;
				$("#final").css({
					opacity : dif
				});
			}
		})
	});
<%-- product modal --%>
	// Get the modal
	var modal = document.getElementById('myModal');

	// Get the image and insert it inside the modal - use its "alt" text as a caption
	var img = document.getElementById('myImg');
	var modalImg = document.getElementById("img01");
	var captionText = document.getElementById("caption");
	img.onclick = function() {
		modal.style.display = "block";
		modalImg.src = this.src;
		captionText.innerHTML = this.alt;
	}
	modalImg.onclick = function() {
		modal.style.display = 'none';
	}
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
		modal.style.display = "none";
	}

			(
					function e() {
						var e = document.createElement("script");
								e.type = "text/javascript",
								e.async = true,
								e.src = "//staticw2.yotpo.com/AWBmHDPEV8gZInAKIzqiBNCLiDjvAjBbQ64WJRHp/widget.js";
						var t = document.getElementsByTagName("script")[0];
						t.parentNode.insertBefore(e, t)
					})();

	/* function change(){
	var selectObject = document.getElementById("sel").value;
	if(selectObject=="X"){
		document.getElementById("qty").value=Math.floor(Math.random() * 20) + 1;
	}else if(selectObject=="L"){
		document.getElementById("qty").value=Math.floor(Math.random() * 30) + 1;
	}
	
	}
	 */
</script>

<script>
	
<%-- loginPopup --%>
	function popupOpen() {
		/* 	var popUrl="member/login.jsp"; */
		/* var w = 347;
		var h = 284;
		var left = (window.screen.width/2)-(w/2);
		var top = (window.screen.height/2)-(h/2);

		var win = window.open("member/login.jsp", "_blank", 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=347, height='+h);
		win.moveTo(left, top); */

		/* 
		var popOption="right=700, top=290, resizable=no, scrollbars=no, status=no;";
		window.open(popUrl,"",popOption); */

		cw = screen.availWidth; //화면 넓이
		ch = screen.availHeight; //화면 높이

		sw = 347; //띄울 창의 넓이
		sh = 284; //띄울 창의 높이

		ml = (cw - sw) / 2; //가운데 띄우기위한 창의 x위치
		mt = (ch - sh) / 2; //가운데 띄우기위한 창의 y위치

		window
				.open('member/loginForm', 'tst', 'width=' + sw + ',height='
						+ sh + ',top=' + mt + ',left=' + ml
						+ ',resizable=no,scrollbars=yes');

	}

	//
	// recent item    
	var Cpage; // 현재 페이지 
	var pagingSize = 3; // 원하는 페이지 사이즈로 조정하세용 
	function chkRecent(a) {
		var itemID = getCookie("itemID");
		$("#right_zzim #ul").html(''); // 일단 Ul 내용 지우기... 
		if (itemID) {
			var totcount = itemID.split('&').length - 1; //
			var totpage = Math.ceil(totcount / pagingSize) * 1;

			Cpage = (totpage >= a) ? a : 1;
			Cpage = (Cpage < 1) ? totpage : Cpage;

			var start = (Cpage - 1) * pagingSize;

			for (i = start; i <= start + (pagingSize - 1); i++) {
				var thisItem = itemID.split('&')[i];
				if (thisItem) {
					var itemId = thisItem.split(':')[0];
					var itemImg = thisItem.split(':')[1];
					var itemName = thisItem.split(':')[2];
					$("#right_zzim #ul")
							.append(
									'<a href="productDetail.did?pseq='
											+ itemId
											+ '" target="_top"><img src="product_images/'+itemImg+'"  width="100" border=1><div>'
											+ itemName + '</div> </a><br>')
				}
			}

			$("#paging").show();
		} else {
			$("#right_zzim ul").append(
					'<p class="noData">최근 본 상품이<br> 없습니다.</p>');
			$("#paging").hide();
			$("#recentCnt").text('');
		}

		updateRecentPage(totcount, Cpage);

	}

	chkRecent(1);

	function removeRecentItem(itemname) {
		var itemID = getCookie("itemID");
		itemID = itemID.replace(itemname + "&", "");
		setCookie("itemID", itemID, 1);
		chkRecent(Cpage);
	}

	function updateRecentPage(totcount, Cpage) { //  

		$("#recentCnt").text(totcount); //

		$("#totalPageCount").text("/" + Math.ceil((totcount / pagingSize) * 1));
		if (Math.ceil((totcount / pagingSize) * 1) < Cpage) {
			$("#currentPage").text(Math.ceil((totcount / pagingSize) * 1));
		} else {
			$("#currentPage").text(Cpage); //
		}
	}

	$(".btn_next").on('click', function() {
		chkRecent(Cpage + 1);

	});

	$(".btn_prev").on('click', function() {
		chkRecent(Cpage - 1);
	});

	function getCookie(cookieName) {
		var search = cookieName + "=";
		var cookie = document.cookie;

		// 현재 쿠키가 존재할 경우
		if (cookie.length > 0) {
			// 해당 쿠키명이 존재하는지 검색한 후 존재하면 위치를 리턴.
			startIndex = cookie.indexOf(cookieName);

			// 만약 존재한다면
			if (startIndex != -1) {
				// 값을 얻어내기 위해 시작 인덱스 조절
				startIndex += cookieName.length;

				// 값을 얻어내기 위해 종료 인덱스 추출
				endIndex = cookie.indexOf(";", startIndex);

				// 만약 종료 인덱스를 못찾게 되면 쿠키 전체길이로 설정
				if (endIndex == -1)
					endIndex = cookie.length;

				// 쿠키값을 추출하여 리턴
				return unescape(cookie.substring(startIndex + 1, endIndex));
			} else {
				// 쿠키 내에 해당 쿠키가 존재하지 않을 경우
				return false;
			}
		} else {
			// 쿠키 자체가 없을 경우
			return false;
		}
	}

	function checkTitle(form) {
		var title = form.subject.value;
		if (title == "") {
			alert("Please enter a title");
			form.subject.focus();
		} else {
			form.method = "post";
			form.action = "qnaWrite.did";
			form.submit();
		}
	}
</script>

</html>

