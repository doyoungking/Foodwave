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

	<form action="inputSave" method="post" onsubmit="return chk()"
		encType="multipart/form-data">
		<div class="mb-3">
			<label for="formGroupExampleInput" class="form-label">작성자</label> <input
				type="text" class="form-control" id="name" name="username">
		</div>
		<div class="mb-3">
			<label for="formGroupExampleInput2" class="form-label">여행지 장소</label>
			<input type="text" class="form-control" id="place" name="place">
		</div>
		<div class="mb-3">
			<label for="formGroupExampleInput2" class="form-label">맛집 이름</label>
			<input type="text" class="form-control" id="restaurant"
				name="restaurant">
		</div>
		<div class="mb-3">
			<label for="formGroupExampleInput2" class="form-label">리뷰</label> <input
				type="text" class="form-control" id="review" name="review">

			비밀번호<input type="text" name="pw" id="pw">


		</div>
		<div class="mb-3">
			첨부파일1<input type=file name="file"> 첨부파일2<input type=file
				name="file">
		</div>
		<input type=submit value="전송">
	</form>


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

<script>
	function chk() {
		let name = document.getElementById('name')
		let place = document.getElementById('place')
		let good = document.getElementById('restaurant')
		let pw = document.getElementById('pw')
		if (name.value == '') {
			alert('작성자는 필수 입력입니다');
			name.focus();
			return false;
		} else if (place.value == '') {
			alert('여행지는 필수 입력입니다');
			place.focus();
			return false;
		} else if (good.value == '') {
			alert('맛집은  필수 입력입니다');
			good.focus();
			return false;
		} else if (pw.value == '') {
			alert('비밀번호는 필수 입력입니다');
			pw.focus();
			return false;
		} else {
			return true;
		}
	}
</script>

</html>