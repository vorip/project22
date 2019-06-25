<%@page import="bean.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Clean Blog - Start Bootstrap Theme</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="imgtest.js"></script>


</head>
<body>

	<!-- 상단 메뉴바 -->
	<div align="center">
		<a href="home.jsp"><img class="logo" src="main.png" align="center" style = "width: 300px; height: 300px; margin: 0px; margin-top: 30px;"></a>
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

	<jsp:useBean id="dto" class="bean.MemberDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto" />

	<%
		MemberDAO dao = new MemberDAO();
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");

		boolean check = dao.loginCheck(name, pw);

		if (check == true) {
			session.setAttribute("name", name);
	%>

		<!-- Main Content -->
		<div class="container">
			<p>로그인 성공</p>
			<a href = "home.jsp"><input type = "button" value = "메인으로"></a>
		</div>

	<%
		} else {
			response.sendRedirect("loginPage.jsp");
		}
	%>



	<hr>

</body>
</html>