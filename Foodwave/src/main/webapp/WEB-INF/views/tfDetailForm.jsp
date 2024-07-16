<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<body>
	<h1>여행지 맛집 추천 사이트</h1>
	<header class="p-3 text-bg-dark">
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				<a href="/"
					class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
					<svg class="bi me-2" width="40" height="32" role="img"
						aria-label="Bootstrap">
						<use xlink:href="#bootstrap"></use></svg>
				</a>

				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><a href="http://localhost:8099/hom"
						class="nav-link px-2 text-secondary">Home</a></li>
					<li><a href="http://localhost:8099/hom/input"
						class="nav-link px-2 text-white">등록</a></li>

					<li><a href="http://localhost:8099/hom/tList"
						class="nav-link px-2 text-white">전체보기</a></li>

				</ul>

				<form class="d-flex" action="search" method="get">
					<input class="form-control me-2" type="text" placeholder="맛집검색"
						aria-label="Search" name="searchKeyword">
					<button class="btn btn-outline-light" type="submit">search</button>
				</form>
			</div>
		</div>
	</header>



	<main class="container">
		<header class="py-5 text-center">
			<h1>${comvo.restaurant}</h1>
		</header>


		<div class="row g-5">
			<section class="col-md-3 col-lg-4 order-md-last">
				<aside>
					<p>글번호:${comvo.no}</p>
					<p>작성자:${comvo.username}</p>
					<p>여행지:${comvo.place}</p>
					<p>등록일:${comvo.in_date}</p>
					
				</aside>

			</section>

				
			<article id="article-content" class="col-md-9 col-lg-8">
				<pre>review</pre>
				<p>${comvo.review}</p>
			</article>
<br>
					첨부파일 
					<c:forEach items="${attach}" var="fname">
					<img src ="download?filename=${fname}">
					<a href="download?filename=${fname}">${fname}</a>
					</c:forEach>
					

		</div>

	</main>



	<main class="container">
		<h4 class="pb-2 border-bottom">comment</h4>
		<table>
			<c:forEach items="${selcom}" var="tfvo">
				<tr>
					<th>작성자:${tfvo.c_user}</th>
				</tr>
				<tr>
					<td class="pb-2 border-bottom">${tfvo.tf_comment}</td>

				</tr>
			</c:forEach>
		</table>
	</main>



	<br>

	<main class="container">
		<form action="commentSave" method="post" onsubmit="return chk()">
			<h2 class="pb-2 border-bottom">댓글작성</h2>
			<table>
				<tr>

					<input type="hidden" name="c_no" value="${comvo.no}">
					<th>작성자<input type="text" name="c_user" id="user"></th>

				</tr>
				<tr>
					<td><textarea name=tf_comment placeholder="댓글쓰기" cols="40"
							rows="8"></textarea></td>

				</tr>
			</table>
			<input type=submit value="댓글작성">
		</form>
	</main>


	<div class="container">
		<footer class="py-3 my-4">
			<ul class="nav justify-content-center border-bottom pb-3 mb-3">
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-body-secondary">개발자:김도영</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-body-secondary">개발기간:2024/05/24</a></li>
			</ul>
			<p class="text-center text-body-secondary">© 2024 doyoung, Inc</p>
		</footer>
	</div>

</body>
<script>

	function chk() {
		let user = document.getElementById('user')
		if (user.value == '') {
			alert('작성자는 필수 입력입니다');
			user.focus();
			return false;
		} else {
			return true;
		}
	}
	
	
	
	
</script>


</html>