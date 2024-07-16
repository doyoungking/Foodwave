<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ page session="true" %><!-- 서버의 세션 영역에 변수에 접근 하게 한다. -->
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
<style>
#like {
	width: 50px;
	fill: red;
}




</style>
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
				
				<div>
				<c:if test="${userid !=null }">
				<span>사용자 정보: ${userid }/${username }/${grade }</span>
				<span><a href="logout">로그아웃</a></span>
				</c:if>
				</div>

				<form class="d-flex" action="search" method="get">
					<input class="form-control me-2" type="text" placeholder="맛집검색"
						aria-label="Search" name="searchKeyword">
					<button class="btn btn-outline-light" type="submit">search</button>
				</form>
				
			</div>
		</div>
	</header>


	<table class="table">
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>여행지장소</th>
				<th>맛집이름</th>
				
				<th>등록일</th>
				<th>좋아요</th>


			</tr>
		</thead>
		<tbody id="tbody">
			<c:forEach items="${allListTF}" var="tfvo">
				<tr>
					<th>${tfvo.no}</th>
					<td>${tfvo.username}</td>
					<td>${tfvo.place}</td>
					<td>${tfvo.restaurant}</td>
					
					<td>${tfvo.in_date}</td>
					<td><a href=# onclick="likechk(${tfvo.no})"><svg
								xmlns="http://www.w3.org/2000/svg" width="20" height="20"
								fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16"
								id="like">
  <path fill-rule="evenodd"
									d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314" />
</svg></a>+${tfvo.love}</td>
					<td>
					<button type="button" class="btn btn-outline-danger">
							<a href=# onclick="delchk(${tfvo.no},${tfvo.pw})">삭제</a>
						</button>
						
						<button type="button" class="btn btn-outline-info">
							<a href=# onclick="modchk(${tfvo.no},${tfvo.pw})">수정</a>
						</button>
						<button type="button" class="btn btn-outline-secondary">
							<a href="tfDetail?no=${tfvo.no}">자세히보기</a>
						</button></td>
				</tr>

			</c:forEach>

		</tbody>
		<tr>
				<td colspan=4 align=center>
					<c:if test="${pagevo.prev }">
						<a href="tList?page=${pagevo.startPage -1 }">[이전페이지그룹]</a>
					</c:if> 
					
					<c:forEach begin="${pagevo.startPage }" end="${pagevo.endPage }"
						var="idx">
						<a href="tList?page=${idx}"> 
							<c:if
								test="${idx == pagevo.page }">[</c:if> ${idx } <c:if
								test="${idx == pagevo.page }">]</c:if>
						</a>
					</c:forEach> 
					
					<c:if test="${pagevo.next }">
						<a href="tList?page=${pagevo.endPage +1 }">[다음페이지그룹]</a>
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
<script>

	function likechk(no){
		console.log(no);
		location.href="likeup?no="+no
	}
	
	
	function delchk(dno,pass){
		var inpass = prompt('비밀번호를 입력하세요','password');
		if(inpass == pass){
			if(confirm("삭제합니까?")){
			location.href="delete?no="+dno
			}
		}else{
		alert("비밀번호가 일치하지 않습니다")
		}
	}
	
	
	
	
	
	function modchk(mno,pass){
		var inpass = prompt('비밀번호를 입력하세요','password');
		if(inpass == pass){
			if(confirm("수정합니까?")){
			location.href="update?no="+mno
			}
		}else{
		alert("비밀번호가 일치하지 않습니다")
		}
	}
	
	
	
</script>
</html>