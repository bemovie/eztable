<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<table>
				<thead>
					<tr>
						<th>고객번호</th>
						<th>고객이름</th>
						<th>연락처</th>
						<th>캐시</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${list}">
					<tr>
						<td>${item.custCode}</td>
						<td>${item.custName}</td>
						<td>${item.custPhone}</td>
						<td>${item.cache}</td>
						<td><a href="delete/${item.custCode}" class="btn btn-danger btn-sm"><i class="bi bi-trash"></i></a> 
							<a href="update/${item.custCode}" class="btn btn-warning btn-sm"><i class="bi bi-wrench-adjustable"></i></a>
							<button class="btn btn-sm btn-primary cart"><i class="bi bi-cart"></i></button>
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
