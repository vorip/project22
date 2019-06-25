<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>Clean Blog - Start Bootstrap Theme</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<style>
#wrap {
	width: 530px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

table {
	border: 3px solid skyblue
}

td {
	border: 1px solid skyblue
}

#title {
	background-color: skyblue
}
</style>

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


	<jsp:useBean id="dto" class = "bean.MemberDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto" />


	<!-- Main Content -->
	<div id="wrap">
		<br> <br> <b><font size="6" color="gray">회원가입</font></b> <br>
		<br> <br>

		<form method="post" action="signUp2.jsp">
			<table>
				<tr>
					<td id="title">이름</td>
					<td><input type="text" name="name" maxlength="20"></td>
				</tr>

				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="pw" maxlength="15"></td>
				</tr>

				<tr>
					<td id="title">나이</td>
					<td><input type="text" name="age" maxlength="15"></td>
				</tr>
				<tr>
					<td id="title">성별</td>
					<td><input type="radio" name="gender" value="m">m
						<input type="radio" name="gender" value="g">g <br></td>
				</tr>
				<tr>
					<td id="title">전화 번호</td>
					<td><input type="text" size="20" name="tel" /></td>
				</tr>
				<tr>
					<td id="title">주소</td>
					<td><input type="text" size="50" name="addr" /></td>
				</tr>
			</table>
			<br> <input type="submit" value="가입" /> <input type="button"
				value="취소">
		</form>
	</div>


</body>
</html>