<%@page import="bean.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="main.css">
<link href="bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<!-- 상단 메뉴바 -->
	<div align="center">
		<a href="home.jsp"><img class="logo" src="main.png" align="center" style = "width: 300px; height: 310px; margin: 0px; margin-top: 30px;"></a>
		<div style="height: 50px;
	background: skyblue;">
			<table>
				<tr height="10px">
					<td style="width: 500px;text-align: center;padding-bottom: 9px;padding-top: 5px;"><a style="color: #f2f2f2;font-size: 30px;font-family: 굴림;text-decoration: none;text-align: center;" href="resa.jsp">예약</a></td>
					<td style="width: 500px;text-align: center;padding-bottom: 9px;padding-top: 5px;"><a style="color: #f2f2f2;font-size: 30px;font-family: 굴림;text-decoration: none;text-align: center;" href="notice.jsp?index=0">게시판</a></td>
					<td style="width: 500px;text-align: center;padding-bottom: 9px;padding-top: 5px;"><a style="color: #f2f2f2;font-size: 30px;font-family: 굴림;text-decoration: none;text-align: center;" href="my.jsp">마이페이지</a></td>
					<td style="width: 500px;text-align: center;padding-bottom: 9px;padding-top: 5px;"><a style="color: #f2f2f2;font-size: 30px;font-family: 굴림;text-decoration: none;text-align: center;" href="notice2.jsp?index=0">고객센터</a></td>
				</tr>
			</table>
		</div>
	
	<!-- DTO 불러오기 -->
	<jsp:useBean id="dto" class="bean.NoticeDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto" />


	<!-- 불러오기 -->


	<!-- Main Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<p align="center" style="margin-top: 30px;">우리 사이트에 대한 불편사항이나 문의사항, 건의사항 등이 있다면 글을 작성해주세요.</p><br>
				<form action="insertPost.jsp">
					<button type="submit" style="float: left">글 작성</button><br><br>
					<input type="hidden" name = "nullDoctor" value="true">
				</form>
				<ul class="list-group list-group-flush">
					<li class="list-group-item"
						style="padding-bottom: 3px; padding-top: 3px;">
						<table>
							<tr>
								<td	style="font: 12px 굴림; font-weight: bold; padding-left: 200px;">제목</td>
								<td style="font: 12px 굴림; font-weight: bold; padding-left: 230px;">작성자</td>
								<td	style="font: 12px 굴림; font-weight: bold; padding-left: 100px;">날짜</td>
							</tr>
						</table>
					</li>
					<%!int i;%>
					<%
						NoticeDAO dao = new NoticeDAO();
						ArrayList<NoticeDTO> list = dao.suggestAll();
						i = Integer.parseInt(request.getParameter("index"));
						NoticeDTO conDto = null;
						while (i < list.size()) {
							conDto = list.get(i);
							String info = conDto.toString();
					%>

					<%-- <%= conDto.getName() %>
						<%= conDto.getContent() %>
						<%= conDto.getTime() %>
						<%= conDto.getUnum() %> --%>
					<li class="list-group-item"
						style="padding-bottom: 5px; padding-top: 5px;">
						<table>
							<tr>
								<td style="font: 12px 굴림; font-weight: bold; width: 100px; padding-left:30px;"><%=i + 1%></td>
								<td style="font: 12px 굴림; font-weight: bold; width: 350px; "><a
									href="post2.jsp?info=<%=info%>"><%=conDto.getTitle()%></a></td>
								<td style="font: 12px 굴림; font-weight: bold; width: 130px; padding-left: 5px;"><%=conDto.getName()%></td>
								<td style="font: 12px 굴림; font-weight: bold;"><%=conDto.getTime()%></td>
							</tr>
						</table>
					</li>
					<%
						i++;
							if (i % 10 == 0 && i != 0) {
								break;
							}
						}
					%>
				</ul>
				<!-- 페이지 -->
				<div class="col-lg-4 col-md-10 mx-auto">
					<ul class="pagination pagination-sm">
						<li class="page-item"><a class="page-link" href="#">Previous</a></li>
						<li class="page-item"><a class="page-link"
							href="notice2.jsp?index=0">1</a></li>
						<%
							if (list.size() % 10 != 0 && list.size() != 0 && list.size()>10) {
								int pageNum = list.size() / 10;
								int index;
								for (index = 1; index <= pageNum; index++) {
						%>

						<li class="page-item"><a class="page-link"
							href="notice2.jsp?index=<%= index*10 %>"><%=index + 1%></a></li>
						<%
							}
							}
						%>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</div>
				<br>

			</div>
		</div>
	</div>

	<hr>
	<!-- 로그인 폼 -->
		<div id="top">
		</div>
	
</body>
</html>