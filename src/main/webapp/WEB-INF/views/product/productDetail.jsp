<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="w3-content"
	style="max-width: 1040px; margin-left: 5%; min-height: 750px;"
	id="section" oncontextmenu="return false">
	<div id="itemdetail">
		<div id="productpath">
			<a href="<%=request.getContextPath()%>/index.did"
				style="text-decoration: none">Home</a> / <a
				href="/mini_project/catagory.did?kind=1"
				style="text-decoration: none"> <c:choose>
					<c:when test="${productVO.kind=='1'}">
					Frenchie Duo Reversible Harness
					</c:when>
					<c:when test="${productVO.kind=='2' }">
					Comfort Leash
					</c:when>
					<c:when test="${productVO.kind=='3' }">
					Hoodie
					</c:when>
					<c:when test="${productVO.kind=='4' }">
					Strap Harness
					</c:when>
					<c:when test="${productVO.kind=='5' }">
					On Sale
					</c:when>
				</c:choose>
			</a> / <a href="/mini_project/productDetail.did?pseq=1"
				style="text-decoration: none">${productVO.name}</a>
			<hr color='gray' id="producthr">
		</div>




		<div class="w3-container" style="margin: 50px 0">
			<div class="w3-half w3-container">
				<!-- Trigger the Modal -->
				<img id="myImg" src="product_images/${productVO.image}"
					alt="${productVO.name}" style="width: 100%">

				<!-- The Modal -->
				<div id="myModal" class="modal">

					<!-- The Close Button -->
					<span class="close"
						onclick="document.getElementById('myModal').style.display='none'">X</span>

					<!-- Modal Content (The Image) -->
					<img class="modal-content" id="img01">

					<!-- Modal Caption (Image Text) -->
					<div id="caption"></div>
				</div>


















			</div>
			<form method="post" name="formm">
				<div class="w3-half w3-container">
					<div>
						<span id="productdetailintro">
							<h1>${productVO.name}</h1>
							<h3>￦${productVO.price2}</h3> <br> <br> <c:choose>
								<c:when test="${productVO.kind=='1'||productVO.kind=='3' }">
									<form name="form">
										<div class="form-group">
											<label for="sel1"><b>사이즈</b> </label> <select
												class="form-control" name="sel" id="sel" onChange="change()">
												<option value="M">M</option>
												<option value="X">X</option>
												<option value="L">L</option>
											</select> <br>
									</form>
								</c:when>
							</c:choose> <!--
					 	<form name="form2">
							<label for="usr"><b> 남은 수량</b> </label> <input type="text"
								name="qty" class="form-control" id="qty" value="20">
						</form> 
						--> <br> <label for="usr"><b> 선택 수량</b> </label> <input
							type="text" name="quantity" class="form-control" id="selqty"
							value="1"> <input type="hidden" name="pseq"
							value="${productVO.pseq}"><br>
			</form>

			<br>
			<div class="w3-container" style="padding-left: 50%";>
				<button class="w3-btn w3-round-xlarge" onclick="go_cart2()">장바구니</button>
				&nbsp&nbsp&nbsp
				<button class="w3-btn w3-round-xlarge" onclick="go_direct_order2()">즉시구매</button>
			</div>
			</span> <br> <br> <b style="color: black">사이즈가 궁금하세요?</b><br>
			<img src="images/sizing.jpg" / style="width: 100%">



		</div>
	</div>
</div>
</div>













</div>





<Br>
<br>
<Br>
<br>








</div>

<script type="text/javascript">

	function checkCookie() {

		var itemID = getCookie("itemID");
		var thisItem = '${productVO.pseq}:${productVO.image}:${productVO.name}'; // 제품 아이디와 이미지 이름을 저장  2차원 배열처럼 쓸려고 짱구를 굴림...  json 형태로 저장도 가능할텐데.... 그건 취향대로 
		if (thisItem) {
			if (itemID != "" && itemID != null) {
				if (itemID.indexOf(thisItem) == -1) { //값이 없으면 
					setCookie("itemID", thisItem + "&" + itemID, 1);
				}
			} else {
				if (itemID == "" || itemID == null) {
					setCookie("itemID", thisItem + "&", 1000);
				}
			}
		}
	}
	checkCookie();

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
	function setCookie(cookieName, cookieValue, expireDate) {
		var today = new Date();
		today.setDate(today.getDate() + parseInt(expireDate));
		document.cookie = cookieName + "=" + escape(cookieValue)
				+ "; path=/; expires=" + today.toGMTString() + ";";
	}

	function popupOpen() {


		alert(id);
		/* if(window.sessionStorage */
		cw = screen.availWidth; //화면 넓이
		ch = screen.availHeight; //화면 높이

		sw = 347; //띄울 창의 넓이
		sh = 284; //띄울 창의 높이

		ml = (cw - sw) / 2; //가운데 띄우기위한 창의 x위치
		mt = (ch - sh) / 2; //가운데 띄우기위한 창의 y위치

		window
				.open('member/login.jsp', 'tst', 'width=' + sw + ',height='
						+ sh + ',top=' + mt + ',left=' + ml
						+ ',resizable=no,scrollbars=yes');

	}
	
	function go_cart2() {
		var login = "<c:out value="${loginUser}"/>";
		//alert(login);

		if (login == null || login == "") {
			<c:set var="loginDir" value="prodDtail" scope="session"/>
			<c:set var="prodNum" value="${productVO.pseq}" scope="session"/>
			popupOpen();
		} else {
			if (document.formm.quantity.value == "") {
				alert("수량을 입력하여 주세요.");
				document.formm.quantity.focus();
			} else {
				document.formm.action = "cartInsert.did";
				document.formm.submit();
			}
		}

	}
	
	function go_direct_order2() {
		var login = "<c:out value="${loginUser}"/>";
		//alert(login);

		if (login == null || login == "") {
			<c:set var="loginDir" value="prodDtail" scope="session"/>
			<c:set var="prodNum" value="${productVO.pseq}" scope="session"/>
			popupOpen();
		} else {
			if (document.formm.quantity.value == "") {
				alert("수량을 입력하여 주세요.");
				document.formm.quantity.focus();
			} else {
				document.formm.action = "orderDirectInsert.did";
				document.formm.submit();
			}
		}

	}
</script>
