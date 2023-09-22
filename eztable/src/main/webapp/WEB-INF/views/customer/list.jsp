<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<div class="container">
		<div>
			<h3>고객 목록</h3>
		</div>
		
		<div>
			총 고객 수 <fmt:formatNumber value="${pager.total}" pattern="#"></fmt:formatNumber> 명
		</div>
		
		<div>
			<table>
				<thead>
					<tr>
						<th>고객번호</th>
						<th>고객이름</th>
						<th>연락처</th>
						<th>캐시</th>
						<th>가입날짜</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${list}">
					<form method="post" action="update/${item.custCode}">
					<tr>
						<td>${item.custCode}</td>
						<td><input type="text" name="custName" value="${item.custName}"></td>
						<td><input type="text" name="custPhone" value="${item.custPhone}"></td>
						<td><input type="number" name="cache" value="${item.cache}"></td>
						<td><fmt:formatDate value="${item.custRegDate}" pattern="yyyy년 MM월 dd일"/></td>
						<td>
							<button type="submit" class="btn btn-danger btn-sm">수정</button>
							<button><a href="delete/${item.custCode}" class="btn btn-warning btn-sm">삭제</a></button>
						</td>
					</tr>
					</c:forEach>	
					
					<c:if test="${list.size() < 1}">
					<tr>
						<td colspan="5">검색 된 고객이 없습니다</td>
					</tr>
					</c:if>
					
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
