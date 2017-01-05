<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="myCarousel" class="carousel slide" data-ride="carousel"
	style="margin-bottom: 10px;">
	<!-- Indicators -->
	<ol class="carousel-indicators ">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
		<li data-target="#myCarousel" data-slide-to="3"></li>
	</ol>
	
	<c:if test="${param.deleteresult==1}">
		<script>
		alert('회원삭제 성공');
		location.replace('index.did') 
		</script>
	</c:if>
	<c:if test="${param.deleteresult==-1}">
		<script>
		alert('회원삭제 실패');
		location.replace('index.did') 
		</script>
	</c:if>
	
	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<img src="image/slideshow_2.jpg" alt="Chania" width="1920"
				height="1000">
		</div>

		<div class="item">
			<img src="image/slideshow_3.jpg" alt="Chania" width="1920"
				height="1000">
		</div>

		<div class="item">
			<img src="image/slideshow_4.jpg" alt="Flower" width="1920"
				height="1000">
		</div>

		<div class="item">
			<img src="image/slideshow_5.jpg" alt="Flower" width="1920"
				height="1000">
		</div>
	</div>

	<!-- Left and right controls -->
	<a class="left carousel-control" href="#myCarousel" role="button"
		data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
		aria-hidden="true"></span> <span class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#myCarousel" role="button"
		data-slide="next"> <span class="glyphicon glyphicon-chevron-right"
		aria-hidden="true"></span> <span class="sr-only">Next</span>
	</a>
</div>


<!-- 	<div class="container-fluid" >
	<p style="text-align: center;"><img alt="Hoodies" src="image/feature1.jpg"
			style="width: 380px; height: 344px; margin-right: 10px; cursor:pointer;" id="myBtn" class="w3-hover-opacity" >
			<img
			alt="Hoodies" src="image/feature2.jpg"
			style="width: 380px; height: 344px; margin-right: 10px"> 
			<img
			alt="Hoodies" src="image/feature3.jpg"
			style="width: 380px; height: 344px; margin-right: 10px"></p>
</div> -->

<div class="w3-content" style="max-width:1040px; margin-left:5%" id="content">
	<table align="center">
		<tr>
			<td style="padding-right:10px;">
				<div class="w3-display-container w3-hover-opacity"style="min-width : 200px; width: 100%" id="1">
					<img alt="Hoodies" src="image/feature1.jpg"
						style="width: 100%; margin-right: 10px; cursor: pointer;"
						id="img" class="img-rounded">
					<div class="w3-display-middle w3-display-hover w3-xlarge">
						<button
							class="w3-btn w3-white w3-border w3-round-large w3-animate-opacity">
							<b>HARNESSES</b>
						</button>
					</div>
				</div>




			</td>
			<td style="padding-right:10px;">
				<div class="w3-display-container w3-hover-opacity"	style="min-width : 200px; width: 100%;" id="2">
					<img alt="Hoodies" src="image/feature2.jpg"
						style="width: 100%; margin-right: 10px; cursor: pointer;"
						id="img" class="img-rounded">
					<div class="w3-display-middle w3-display-hover w3-xlarge">
						<button
							class="w3-btn w3-white w3-border w3-round-large w3-animate-opacity">
							<b>HOODIES</b>
						</button>
					</div>
				</div>




			</td>
			<td>
				<div class="w3-display-container w3-hover-opacity"style="min-width : 200px; width: 100%;"id="3">
					<img alt="Hoodies" src="image/feature3.jpg"
						style="width: 100%; margin-right: 10px; cursor: pointer;"
						id="img" class="img-rounded">
					<div class="w3-display-middle w3-display-hover w3-xlarge">
						<button
							class="w3-btn w3-white w3-border w3-round-large w3-animate-opacity">
							<b>BOW TIES</b>
						</button>
					</div>
				</div>
			</td>
		</tr>
	</table>
	<br> <br>
	<div class="w3-container">
		<div style="margin-right: 0px;">
			<div class="w3-row w3-container"
				style="width: 1000px; padding-left: 0px; padding-right: 0px">
				<%-- tweets --%>
				<div class="w3-half w3-container" 
					style="margin-top: 0px;margin-left:0px; padding-top: 10px; padding-bottom: 10px; padding-left: 0px; padding-right: 10px;">
					<span id="subject" style="margin-bottom: 0px;"><b>TWEETS</b></span>
					<div
						class="fw3-container w3-section w3-border-top w3-border-bottom" style="width:100%; margin-top: 0px !important;">
						<a class="twitter-timeline"
							href="https://twitter.com/FrenchBulldog__"
							data-chrome="noheader nofooter" data-tweet-limit="7"></a>
						<script async src="//platform.twitter.com/widgets.js"
							charset="utf-8"></script>
					</div>
				</div>

				<div class="w3-half w3-container"
					style="margin-top: 0px; padding-top: 10px; padding-bottom: 10px; padding-left:0px; padding-right: 0px">
					<span id="subject" style="margin-bottom: 0px;"><b>#FRENCHBULLDOG</b></span>
					<div class="w3-container w3-section w3-border-top w3-border-bottom"
						style="margin-top: 0px !important;">
						<div id="flickrembed"></div>
						<script
							src="https://flickrembed.com/embed_v2.js.php?source=flickr&layout=responsive&input=frenchbulldog&sort=0&by=keywords&theme=slider&scale=fill&skin=default&id=585b2878f1a84"></script>

					</div>
				</div>
			</div>
			<%-- 트위터랑 인스타그램 --%>
            
		</div>

		<br> <br> <br> <br> <br> <br> <br>
	</div>


</div>
<%-- 
	Modal
	<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
 
    </div>
  </div>     --%>

<script>
	window.name="index";
	$(document).ready(function() {
		$("#myBtn").click(function() {
			$("#myModal").modal();
		});
	});

	$(document).on("scroll", function() {
		if ($(document).scrollTop() > 20) {
			$("#header").addClass("navbar-fixed-top");
		} else {
			$("#header").removeClass("navbar-fixed-top");
		}
	});
</script>


