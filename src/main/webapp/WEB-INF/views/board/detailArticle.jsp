<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pg}" var="page" />
<c:set value="${paging}" var="num" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HoonHoon's personal Page</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="/main/resources/assets/css/main.css" />

<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!-- Scripts -->
<script src="/main/resources/assets/js/jquery.min.js"></script>
<script src="/main/resources/assets/js/jquery.dropotron.min.js"></script>
<script src="/main/resources/assets/js/skel.min.js"></script>
<script src="/main/resources/assets/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script type="text/javascript">
	function comment_insert() {
		var com_url = 'comment/insert';
		var usr_no = ${userNumber};
		console.log(usr_no);
		if(usr_no === 0) {
			console.log('0');
			 $.ajax({
				   url:com_url,
				   method:'post',
				   data:{
					   user_no:'0',
					      comment_user_id:$('#username').val(),
					      comment_content : $('#comment').val(),
					      comment_password : $('#pw').val()   
			      
				   }
	   }).done(function(data){
		   
		   comment_list();
		   $('#comment').val('');
		}); 
	} 
		else {
		  console.log('1');
		  $.ajax({
			   url:com_url,
			   method:'post',
			   data:{
				   user_no:'1',
				      comment_user_id:$('#username').val(),
				      comment_content : $('#comment').val(),
				      comment_password : 'not used'   
		      
			   }
		  }).done(function(data){
			   
			   comment_list();
			   $('#comment').val('');
			}); 
		}
		
		
		}
	
	$(document).ready(function(){
		   comment_list();
		});
	
	function comment_list(){
		   var com_url = 'comment/list';
		   var usr_no = ${userNumber};
		   $.ajax({
		      url:com_url,
		      method:'post',
		      data:{
		         art_no:'${ArticleVO.article_no}'
		      }
		   }).done(function(data){
		      var comment_list = '';
		         comment_list += '   <table boarder="1" nowrap width="700" class="table table-condensed">';
		      $.each(data, function(key,val){
		         comment_list += '      <tr id="'+val['comment_no']+'">';
		         comment_list += '         <td nowrap width="20%">';
		         comment_list += '         '+val['comment_user_id'];
		         comment_list += '         </td>';
		         comment_list += '         <td nowrap width="80%">';
		         comment_list += '            '+val['comment_content'];
		         comment_list += '         </td>';
		         comment_list += '         <td nowrap width="20%">';
		         
		         
		         comment_list += '            '+val['comment_creation_date'];
		         if(usr_no == 0) {
		        	 
		         comment_list += '         <td nowrap width="5%">';
	             comment_list += '         <a href="javascript:comment_delete('+val['comment_no']+' );"><img src="/main/resources/images/btn_close.gif" alt="btn_close"></a>';	 
		         comment_list += '         </td>';
		         } else {
		        	 
		         comment_list += '         </td>';
		         comment_list += '         <td nowrap width="5%">';
		         comment_list += '         </td>';
		         }
		         
		         comment_list += '   </tr>';
		         
		      });
		         comment_list += '   </table>';
		      $('#viewcomment').html(comment_list);
		   });
		}
	function comment_delete(comment_no) {
		alert(comment_no);
	}
</script>

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
					<li class="current"><a href="/main/board/1/1/">자유게시판</a></li>
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
								<footer>
									<a href="#" class="button">Continue Reading</a>
								</footer>
							</section>

						</div>
					</div>
					<div class="8u  12u(narrower) important(narrower)">
						<div id="content">

							<!-- Content -->

							<article>
								<header>
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
						<div>
							<a href="/main/board/1/${pg}/">목록으로</a>
							<c:if test="${userNumber ne '0'}">
								<c:if test="${uinfo.member_id eq articleVO.article_user_id}">
									<a href="delete/">삭제</a>
									<a href="modify/">수정</a>
								</c:if>
							</c:if>
							<c:if test="${userNumber eq '0'}">
								<a href="delete/">삭제</a>
								<a href="modify/">수정</a>
							</c:if>

						</div>

						</article>
						<hr>
						<div id="viewcomment" style="background: #EEEEEE;"
							class="form-inline"></div>
						<hr>
						<c:if test="${userNumber eq '0'}">
							<div>
								<table width="100%" class="commentlayout">
									<tr>
										<td width="20%"><input type="text" class="comment"
											id="username" placeholder="이름" />
											 <input type="password" class="comment" id="pw" placeholder="비밀번호" /></td>
										<td width="60%"><textarea class="commenttext"
												id="comment" placeholder="내용을 입력해주세요"></textarea></td>
										<td width="20%"><input type="button" value="전송"
											onclick="javascript:comment_insert();"/ ></td>
									</tr>
								</table>
							</div>
						</c:if>
						<c:if test="${userNumber ne '0'}">
							<table width="100%" class="commentlayout">
								<tr>
									<td width="20%">${uinfo.member_name}</td>
									<td width="60%"><textarea class="commenttext" id="comment"
											placeholder="내용을 입력해주세요"></textarea></td>
									<td width="20%"><input type="button" value="전송"
										onclick="javascript:comment_insert();"/ ></td>
								</tr>
							</table>
						</c:if>
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



</body>
</html>