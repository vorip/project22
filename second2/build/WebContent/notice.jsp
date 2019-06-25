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
$(function() {
	$("#font_familySel").on("change",function() {
		$("textarea").css("font-family",$(this).val());
	})
	$("#font_size").on("change",function() {
		$("textarea").css("font-size",$(this).val());
	
	})
	$("#font_weight").on("change",function() {
		$("textarea").css("font-weight",$(this).val());
	
	})
	$("#font").on("change",function() {
		$("textarea").css("text-align",$(this).val());
	
	})
})
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
		
		<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<hr>
				<form action=""></form>
				<ul class="list-group list-group-flush">
					<li class="list-group-item"
						style="padding-bottom: 3px; padding-top: 3px;">
						<table>
							<tr>
								<td style="font: 12px 굴림; font-weight: bold; padding-left: 200px;" >제목</td>
								<td style="font: 12px 굴림; font-weight: bold; padding-left: 230px;">작성자</td>
								<td style="font: 12px 굴림; font-weight: bold; padding-left: 100px;">시간</td>
							</tr>
						</table>
					</li>
					<%!int i;%>
					<%
						NoticeDAO dao = new NoticeDAO();
						ArrayList<NoticeDTO> list = dao.noticeAll();
						i=Integer.parseInt(request.getParameter("index"));
						NoticeDTO dto2 = null;
						while (i < list.size()) {
							dto2 = list.get(i);
							String info = dto2.toString();
					%>
						
					<li class="list-group-item"
						style="padding-bottom: 5px; padding-top: 5px;">
						<table>
							<tr>
								<td style="font: 15px 굴림; font-weight: bold; width: 100px"><%=i + 1%></td>
								<td style="font: 15px 굴림; font-weight: bold; width: 350px;">
								<a href="post1.jsp?info=<%= info %>"><%=dto2.getTitle()%></a></td>
								<td style="font: 15px 굴림; font-weight: bold; width: 130px;"><%=dto2.getName()%></td>
								<td style="font: 15px 굴림; font-weight: bold;"><%=dto2.getTime()%></td>
							</tr>
						</table>
					</li>

					<%
						i++;
							if(i % 10 == 0 && i != 0){
								break;
							}
						}
					%>

				</ul>
				<div class="col-lg-4 col-md-10 mx-auto">
					<ul class="pagination pagination-sm">
						<li class="page-item"><a class="page-link" href="">Previous</a></li>
						<li class="page-item"><a class="page-link" href="index.jsp?index=0">1</a></li>
						<%
							if(list.size() % 10 !=0 && list.size() !=0 && list.size()>10){
								int pageNum = list.size() / 10;
								int index;
								for(index = 1; index <= pageNum; index++){
						%>
						<li class="page-item"><a class="page-link" href="index.jsp?index=<%= index*10 %>"><%= index + 1 %></a></li>
						<%
							}
						}%>
						<li class="page-item"><a class="page-link" href="">Next</a></li>	
					</ul>
				</div>
			</div>
		</div>
		<hr>
		<form action = "insertPost.jsp">
			<input name = "nullDoctor" type="hidden" value = "false">
			<a href="insertPost.jsp">글쓰기</a> --%>
		</form>

</body>
</html>