<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pg}" var="page" />
<c:set value="${paging}" var="num" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HoonHoon's personal Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../../../resources/assets/css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
</head>
<body>
	<div id="page-wrapper">
		<!-- Header -->
		<div id="header">

			<!-- Logo -->
			<h1>
				<a href="/main" id="logo">HoonHoon's HomePage</a>
			</h1>

			<!-- Nav -->
			<nav id="nav">
			<ul>
				<!-- <li class="current"><a href="/main">Home</a></li> -->
				<li><a href="#">Dropdown</a>
					<ul>
						<li><a href="#">주인 소개</a></li>
						<li><a href="#">Magna phasellus</a></li>
						<li><a href="#">Etiam sed tempus</a></li>
						<li><a href="#">Submenu</a>
							<ul>
								<li><a href="#">Lorem dolor</a></li>
								<li><a href="#">Phasellus magna</a></li>
								<li><a href="#">Magna phasellus</a></li>
								<li><a href="#">Etiam nisl</a></li>
								<li><a href="#">Veroeros feugiat</a></li>
							</ul></li>
						<li><a href="#">Veroeros feugiat</a></li>
					</ul></li>
				<li class="current"><a href="../../../board/1/1/">자유 게시판</a></li>
				<li><a href="blog/">블로그</a></li>
				<li><a href="regist/">regist</a></li>
			</ul>
			</nav>

		</div>





		<!-- Main -->
		<section class="wrapper style1">
		<div class="container">
			<div class="row 200%">
				<div class="4u 12u(narrower)">
					<div id="sidebar">

						<!-- Sidebar -->

						<section>
						<h3>자유게시판쪽</h3>
						<p>Table 사이즈 잡아줘야함.<br> a태그 스타일 반대로 바꿀수 있으면 바꾸기<br>페이징처리 예쁘게</p>
						<footer> <a href="#" class="button">Continue Reading</a>
						</footer> </section>

						<section>
						<h3>Another Subheading</h3>
						<ul class="links">
							<li><a href="#">Amet turpis, feugiat et sit amet</a></li>
							<li><a href="#">Ornare in hendrerit in lectus</a></li>
							<li><a href="#">Semper mod quis eget mi dolore</a></li>
							<li><a href="#">Consequat etiam lorem phasellus</a></li>
							<li><a href="#">Amet turpis, feugiat et sit amet</a></li>
							<li><a href="#">Semper mod quisturpis nisi</a></li>
						</ul>
						<footer> <a href="#" class="button">More Random Links</a>
						</footer> </section>

					</div>
				</div>
				<div class="8u  12u(narrower) important(narrower)">
					<div id="content">

						<!-- Content -->

						<article> <header>
						<h2>자유게시판</h2>
						<p>자유롭게 이야기 하는 게시판.</p>
						</header>
					</div>

					<table>

						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
						<c:forEach items="${list}" var="vo">
							<tr>
								<td>${vo.article_no}</td>
								<td><a href="${vo.article_no}/">${vo.article_title}</a></td>
								<td>${vo.article_user_id}</td>
								<td>${vo.article_creation_date}</td>
								<td>${vo.article_readcount}</td>
							</tr>
						</c:forEach>
					</table>
					<div class="paging">${num}</div>


					</article>

				</div>
			</div>
		</div>
	</div>
	</section>

	<!-- Footer -->
	<!-- Footer -->
				<div id="footer">
					<div class="container">
						<div class="row">
						
						
						</div>
					</div>

					<!-- Icons -->
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-github"><span class="label">GitHub</span></a></li>
							<li><a href="#" class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li>
							<li><a href="#" class="icon fa-google-plus"><span class="label">Google+</span></a></li>
						</ul>

					<!-- Copyright -->
						<div class="copyright">
							<ul class="menu">
								<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>

				</div>



	<!-- Scripts -->
	<script src="../../../resources/assets/js/jquery.min.js"></script>
	<script src="../../../resources/assets/js/jquery.dropotron.min.js"></script>
	<script src="../../../resources/assets/js/skel.min.js"></script>
	<script src="../../../resources/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="../../../resources/assets/js/main.js"></script>

</body>
</html>