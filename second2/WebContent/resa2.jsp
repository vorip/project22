<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#div {
	position: relative;
	left: 455px;
	top: -46px;
	font-size: 12px;
}

#png5 {
	position: relative;
	left: -243px;
	top: -83px;
}

#top10 {
	position: relative;
	left: 110px;
	top: -20px;
}

#top10_0 {
	position: relative;
	left: 110px;
	top: -10px;
}

#top10_1 {
	position: relative;
	top: 7px;
	left: 110px;
}

.top10_2 {
	position: relative;
	top: 19px;
	left: 110px;
}

#top10_2 {
	left: 110px;
}

#top10_3 {
	position: relative;
	top: -87px;
	left: 110px;
}
</style>
</head>

<body>
	<%
		String[] hospitalInfo = request.getParameter("data").split(",");
		String address = hospitalInfo[1].substring(5, hospitalInfo[1].length() - 1);
		Calendar cal = Calendar.getInstance();
		String today;
		String str = (cal.get(Calendar.YEAR) + "");
		today = str + "." + (cal.get(Calendar.MONTH) + 1) + "." + cal.get(Calendar.DATE);
		int day = cal.get(Calendar.DATE);
		int endDay = 0;
		switch (cal.get(Calendar.MONTH)) {
		case 3:
		case 5:
		case 8:
		case 10:
			endDay = 30;
			break;
		case 1:
			endDay = 28;
			break;
		default:
			endDay = 31;
			break;
		}
		int[] yeyakDay = new int[endDay - day];
		int[] yeyakHour = { 9, 10, 11, 12, 13, 14, 15, 16, 17 };
		boolean key = true;
	%>
	<div
		style="display: block; margin-left: auto; margin-right: auto; width: 750px; height: 1000px; margin-top: 140px;">
		<div
			style="width: 750px; height: 240px; padding-top: 50px; padding-bottom: 10px;">
			<h1 align="center" style="padding-top: 30px;"><%=hospitalInfo[0]%></h1>
			<div style="background: white;">
				<center>
					<table>
						<tr>
							<td align="center">정형외과</td>
							<td align="center" style="padding-left: 8px; padding-right: 8px;">|</td>
							<td align="center">평점</td>
							<td align="center" style="padding-left: 8px; padding-right: 8px;">|</td>
							<td align="center">리뷰</td>
						</tr>
					</table>
				</center>
				<center>
					<table style="padding-top: 15px;">
						<tr>
							<td align="center"><a href=""><img src="yeyakimg/1.png"></a></td>
							<td align="center"
								style="padding-left: 25px; padding-right: 25px;"><a href=""><img
									src="yeyakimg/2.png"></a></td>
							<td align="center"><a href=""><img src="yeyakimg/3.png"></a></td>
							<td align="center" style="padding-left: 25px;"><a href=""><img
									src="yeyakimg/4.png"></a></td>
						</tr>
					</table>
				</center>
			</div>
			<hr color="gray">
			<div style="height: 258px;">

				<h3 id="top10_0" style="padding-top: 35px;">상세정보</h3>
				<div id="div" style="color: gray;">
					<span>업데이트 <%=today%></span><span
						style="padding-left: 7px; padding-right: 7px;">|</span><span><a
						style="color: gray;" href="">틀린정보 신고</a></span>
				</div>
				<span id="top10"><%=address%></span><br> <a id="top10_1"
					href="http://mgr.kgitbank.com">http://mgr.kgitbank.com</a><br>
				<span class="top10_2"><%=hospitalInfo[2]%></span><span
					class="top10_2" style="color: gray; padding-left: 8px;"
					id="top10_2">대표번호</span><br> <span id="top10_3">깨끗한 시설과
					국내 최고의 의료진 상시 대기</span> <a href="" id="png5"><img src="yeyakimg/5.png"></a>
			</div>
			<hr color="gray">
			<center>
				<div>
					<form action="yeyak.jsp">
						<h3>예약</h3>
						이름 : <input id="name" name="name" type="text"><br> 
						병원 : <input id="hospital" name="hospital" type="text" value="<%=hospitalInfo[0]%>" readonly="readonly"><br>
						주소 : <input id="address" name="address" type="text"	value="<%=hospitalInfo[1]%>" readonly="readonly"><br>
						원하는 과 : <input id="body" name="body" type="text" value="leg" readonly="readonly"><br>
						담당의 : <input id="doctor" name="doctor" type="text" value="doctor_choi" readonly="readonly"><br>
						<select id="yeyakDay" name="day">
							<option>날짜</option>
							<%
								for (int i = 0; i < yeyakDay.length; i++) {
									if (key) {
										yeyakDay[i] = day + i + 1;
							%>
							<option value="<%=yeyakDay[i]%>"><%=yeyakDay[i]%>일
							</option>
							<%
								}
								}
							%>
						</select> <select id="yeyakHour" name="hour"><br>
							<option>시간</option>
							<%
								for (int i = 0; i < yeyakHour.length; i++) {
									if (key) {
							%>
							<option value="<%=yeyakHour[i]%>"><%=yeyakHour[i]%>시
							</option>
							<%
								}
								}
							%>
						</select> 가격 : <input id="price" name="price" type="text" value="5000" readonly="readonly"><br>
						<input type = "text" value="1234" name = "pw" readonly="readonly"> 
						<button id="yeyakButton" type="submit">예약</button>
					</form>
				</div>
			</center>
		</div>
	</div>

</body>

</html>