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
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../../../../resources/assets/css/main.css" />
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
				<li class="current"><a href="../../../../board/1/1/">자유게시판</a></li>
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
						<h3>Just a Subheading</h3>
						<p>Phasellus quam turpis, feugiat sit amet ornare in,
							hendrerit in lectus. Praesent semper mod quis eget mi. Etiam eu
							ante risus. Aliquam erat volutpat. Aliquam luctus et mattis
							lectus sit amet pulvinar. Nam turpis et nisi etiam.</p>
						<footer> <a href="#" class="button">Continue Reading</a>
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
							<th>글번호</th>
							<td>${articleVO.article_no}</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${articleVO.article_user_id}</td>
						</tr>
						<tr>
							<th>글제목</th>
							<td>${articleVO.article_title}</td>
						</tr>
						<tr>
							<th>글내용</th>
							<td>${articleVO.article_content}</td>
						</tr>
						<tr>
							<th>작성일</th>
							<td>${articleVO.article_creation_date}</td>
						</tr>
						<tr>
							<th>조회수</th>
							<td>${articleVO.article_readcount}</td>
						</tr>
					</table>

					<a href="delete/">삭제</a> <a href="modify/">수정</a> <a
						href="/main/board/1/${pg}/">목록으로</a>


					</article>

				</div>
			</div>
		</div>
	</div>
	</section>

	<!-- Footer -->
	<div id="footer">
		<div class="container"></div>

		<!-- Icons -->
		<ul class="icons">
			<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
			<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
			<li><a href="#" class="icon fa-github"><span class="label">GitHub</span></a></li>
			<li><a href="#" class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li>
			<li><a href="#" class="icon fa-google-plus"><span
					class="label">Google+</span></a></li>
		</ul>

		<!-- Copyright -->
		<div class="copyright">
			<ul class="menu">
				<li>&copy; Untitled. All rights reserved</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>

	</div>

	</div>

	<!-- Scripts -->
	<script src="../../../../resources/assets/js/jquery.min.js"></script>
	<script src="../../../../resources/assets/js/jquery.dropotron.min.js"></script>
	<script src="../../../../resources/assets/js/skel.min.js"></script>
	<script src="../../../../resources/assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="../../../../resources/assets/js/main.js"></script>

</body>
</html>