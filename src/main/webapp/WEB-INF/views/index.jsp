<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<!--
	Arcana by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>HoonHoon's personal page</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="resources/assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="resources/assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="resources/assets/css/ie9.css" /><![endif]-->
	</head>
	<body>
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header">

					<!-- Logo -->
						<h1><a href="/main" id="logo">HoonHoon's HomePage</a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<!-- <li class="current"><a href="/main">Home</a></li> -->
								<li>
									<a href="#">Dropdown</a>
									<ul>
										<li><a href="#">주인 소개</a></li>
										<li><a href="#">Magna phasellus</a></li>
										<li><a href="#">Etiam sed tempus</a></li>
										<li>
											<a href="#">Submenu</a>
											<ul>
												<li><a href="#">Lorem dolor</a></li>
												<li><a href="#">Phasellus magna</a></li>
												<li><a href="#">Magna phasellus</a></li>
												<li><a href="#">Etiam nisl</a></li>
												<li><a href="#">Veroeros feugiat</a></li>
											</ul>
										</li>
										<li><a href="#">Veroeros feugiat</a></li>
									</ul>
								</li>
								<li><a href="board/1/1/">자유게시판</a></li>
								<li><a href="blog/">블로그</a></li>
								<li>
									<a href="login/">회원</a>
									<ul>
										<li><a href="regist/">회원가입</a></li>
										<li><a href="login/">로그인</a></li>
									</ul>
								</li>
								<c:if test="${userNumber eq '0'}"><li>${userNumber}비회원${session.userNumber}</a></li></c:if>
								<c:if test="${userNumber ne '0'}"><li>${userNumber}회원${uinfo.member_no}</a></li></c:if>
							</ul>
						</nav>

				</div>

			<!-- Banner -->
				<section id="banner">
					<header>
						<h2>Arcana: <em>A responsive site template freebie by <a href="http://html5up.net">HTML5 UP</a></em></h2>
						<a href="#" class="button">Learn More</a>
					</header>
				</section>

			<!-- Highlights -->
				<section class="wrapper style1">
					<div class="container">
						<div class="row 200%">
							<section class="4u 12u(narrower)">
								<div> 
								
									<h3>자유게시판</h3>
									<ul>
									<c:forEach var="vo" items="${list}">
									<li><div><a href="board/1/1/${vo.article_no}/"><font size="2">${vo.article_title}</font></a> <em>${vo.article_user_id}</em> ${vo.article_creation_date}</div></li>
									</c:forEach>
									</ul>
								</div>
							</section>
							<section class="4u 12u(narrower)">
								<div class="box highlight">
									<i class="icon major fa-pencil"></i>
									<h3>blog area</h3>
									<p>myblog new article</p>
								</div>
							</section>
							<section class="4u 12u(narrower)">
								<div class="box highlight">
									<i class="icon major fa-wrench"></i>
									<h3>hobby area</h3>
									<p>this page is hobby's page</p>
								</div>
							</section>
						</div>
					</div>
				</section>
			<!-- Gigantic Heading -->
				<section class="wrapper style2">
					<div class="container">
						<header class="major">
							<h2>A gigantic heading you can use for whatever</h2>
							<p>With a much smaller subtitle hanging out just below it</p>
						</header>
					</div>
				</section>
		
			<!-- Footer -->
				<div id="footer">
					<div class="container">
						<div class="row">
						
						
						</div>
					</div>

					<!-- Icons -->
						<ul class="icons">
							<li><a href="https://twitter.com/kj7310" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="https://www.facebook.com/sanghoon.kim.35" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="https://github.com/runajoker" class="icon fa-github"><span class="label">GitHub</span></a></li>
						</ul>

					<!-- Copyright -->
						<div class="copyright">
							<ul class="menu">
								<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>

				</div>

		</div>

		<!-- Scripts -->
			<script src="resources/assets/js/jquery.min.js"></script>
			<script src="resources/assets/js/jquery.dropotron.min.js"></script>
			<script src="resources/assets/js/skel.min.js"></script>
			<script src="resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="resources/assets/js/main.js"></script>

	</body>
</html>