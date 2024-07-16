<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
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

	<div id="main">
		<h3>검색내용</h3>
		<table class="table">
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>여행지장소</th>
					<th>맛집이름</th>
					<!--<th>리뷰</th>-->
					<th>등록일</th>


				</tr>
			</thead>
			<tbody>
			
				<c:forEach items="${searchTF}" var="tfvo">
					<tr>
						<th>${tfvo.no}</th>
						<td>${tfvo.username}</td>
						<td>${tfvo.place}</td>
						<td>${tfvo.restaurant}</td>
						<td>${tfvo.in_date}</td>
					</tr>
				</c:forEach>
				
			</tbody>
	</div>
	
			<tr>
				<td colspan=4 align=center>
					<c:if test="${pagevo.prev }">
						<a href="search?searchKeyword=${pagevo.searchKeyword}&page=${pagevo.startPage -1 }">[이전페이지그룹]</a>
					</c:if> 
					
					<c:forEach begin="${pagevo.startPage }" end="${pagevo.endPage }"
						var="idx">
						<a href="search?searchKeyword=${pagevo.searchKeyword}&page=${idx}"> 
							<c:if
								test="${idx == pagevo.page }">[</c:if> ${idx } <c:if
								test="${idx == pagevo.page }">]</c:if>
						</a>
					</c:forEach> 
					
					<c:if test="${pagevo.next }">
						<a href="search?searchKeyword=${pagevo.searchKeyword}&page=${pagevo.endPage +1 }">[다음페이지그룹]</a>
					</c:if></td>
			</tr>
	</table>
	
	
	<footer>
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
	</footer>

</body>
</html>
