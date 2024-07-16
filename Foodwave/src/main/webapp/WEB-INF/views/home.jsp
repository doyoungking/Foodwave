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
				<a href="/hom"
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
		<div id="carouselExampleCaptions" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="2" aria-label="Slide 3"></button>

			</div>
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="5000">
					<img src="./resources/aa.png" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block"></div>
				</div>

				<div class="carousel-item" data-bs-interval="2000">
					<img src="./resources/good.png" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5>최고 요리명소</h5>

					</div>
				</div>
				<div class="carousel-item">
					<img src="./resources/travel.png" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5>인기 여행지</h5>

					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<div class="row">
		<c:forEach items="${allListTF}" var="tfvo">
			<div class="col-lg-4">
				<img src="./resources/foodicon.png" width="200px">
				<h2 class="fw-normal">${tfvo.restaurant}</h2>
				<p>${tfvo.place}</p>
				<p>${tfvo.in_date}</p>

				<p>
					<a class="btn btn-secondary" href="tList">View details »</a>
				</p>
			</div>
		</c:forEach>
		<!-- /.col-lg-4 -->
	</div>


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
