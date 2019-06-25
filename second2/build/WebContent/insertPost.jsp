<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		if ($("#nullDoctor").val() == "true") {
			$("#doctor").empty();
		} else {
		}
		$("#font_familySel").on("change", function() {
			$("textarea").css("font-family", $(this).val());
		})
		$("#font_size").on("change", function() {
			$("textarea").css("font-size", $(this).val());

		})
		$("#font_weight").on("change", function() {
			$("textarea").css("font-weight", $(this).val());

		})
		$("#font").on("change", function() {
			$("textarea").css("text-align", $(this).val());
			

		})
		/* $("#filefile").change(function() {
			$("#filename").val($("#filefile").val());
			var s2 = $("#filename").val();
			var attr = s2.substring(s2.length-3);
			if(attr=="png"||attr=="jpg"||attr=="jpeg"){
				var textContent = $("#content").text().html();
				alert(textContent);
				$("#content").append($("#content").html("<img src="+$("#filename").val()+">"));
				alert($("#content").html())
			}
		}) */
		/* $("#subBtn").click(function() {
			$("#content2").val($("#content").text());
			if($("#title").val().trim()!=""&& $("#content").text().trim()!=""){
			$("#filesub").submit();
			$("#content").find("img").remove();//하나로 합치고 dto는 리퀘스트객체로 수동으로.
			alert("글쓰기가 완료되었습니다.");
			}
			else{
				alert("제목과 내용 둘 다 입력해주세요")
				return false;
			}
		})*/
	})
</script>
</head>
<body>
	<div align="center">
		<a href="home.jsp"><img class="logo" src="main.png" align="center"
			style="width: 300px; height: 300px; margin: 0px; margin-top: 30px;"></a>
		<div style="height: 50px; background: skyblue;">
			<table>
				<tr height="10px">
					<td
						style="width: 500px; text-align: center; padding-bottom: 9px; padding-top: 5px;"><a
						style="color: #f2f2f2; font-size: 30px; font-family: 굴림; text-decoration: none; text-align: center;"
						href="resa.jsp">예약</a></td>
					<td
						style="width: 500px; text-align: center; padding-bottom: 9px; padding-top: 5px;"><a
						style="color: #f2f2f2; font-size: 30px; font-family: 굴림; text-decoration: none; text-align: center;"
						href="notice.jsp?index=0">게시판</a></td>
					<td
						style="width: 500px; text-align: center; padding-bottom: 9px; padding-top: 5px;"><a
						style="color: #f2f2f2; font-size: 30px; font-family: 굴림; text-decoration: none; text-align: center;"
						href="my.jsp">마이페이지</a></td>
					<td
						style="width: 500px; text-align: center; padding-bottom: 9px; padding-top: 5px;"><a
						style="color: #f2f2f2; font-size: 30px; font-family: 굴림; text-decoration: none; text-align: center;"
						href="notice2.jsp?index=0">고객센터</a></td>
				</tr>
			</table>
		</div>
		<!-- 파일첨부 input  -->
		<!-- <form action = "fileSave.jsp" id="filesub" method="post" enctype="Multipart/form-data">
			파일첨부 : <input type="file" id="filefile" name="file" multiple="multiple">
		</form> -->
		<!-- 글쓰기 -->
		<div class="notice_write">
			<h1>게시판 글쓰기</h1>
			<form method="get" action="insertPostRe.jsp">
				
				제목: <input type="text" width="300"size="80" id="title" name="title"><br>
				<select id="font_familySel" name="font_family">
					<option value="dotum">글꼴</option>
					<option class="font_family" id="font_family1" value="dotum">돋움체</option>
					<option class="font_family" id="font_family2" value="궁서체">궁서체</option>
					<option class="font_family" id="font_family3" value="gulim">굴림체</option>
					<option class="font_family" id="font_family4" value="cursive">cursive</option>
					<option class="font_family" id="font_family5" value="arial">arial</option>
					<option class="font_family" id="font_family6" value="serif">serif</option>
				</select><select id="font_size" name="font_size">
					<option value="9px">크기</option>
					<option id="font_size1" value="9px">9pt</option>
					<option id="font_size2" value="12px">12pt</option>
					<option id="font_size3" value="18px">18pt</option>
					<option id="font_size4" value="24px">24pt</option>
				</select><select id="font_weight" name="font_weight">
					<option value="normal">굵기</option>
					<option value="normal">보통</option>
					<option id="font_weight1" value="bold">굵게</option>
				</select><select id="font" name="font">
					<option value="left">글꼴</option>
					<option value="left">왼쪽</option>
					<option value="center">가운데</option>
					<option value="right">오른쪽</option>
				<!-- 파일이름들어가는공간 -->					
				<!-- <input type="hidden" value="" id="filename" name = "filename"> -->
				</select> 
				
				<br><textarea rows="20" cols="50" placeholder="내용을 입력해주세요." name="content" id="content" style="width: 773px;height: 566px;" ></textarea>
				<!-- <div id="content"  contentEditable="true" style="text-align:left; overflow-x:auto; width:500px; height: 300px; border: solid; 1px; margin: 20px; line-height: 20px; "> </div> -->
				<!-- 넘길내용 --><!-- <input type="hidden"name="content" id="content2"> -->
				<br>
				<%
					String s1 = request.getParameter("nullDoctor");
				%>
				<input id="nullDoctor" type="hidden" value="<%=s1%>">
				<div id="doctor">
					병원 : <select name="hospital">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option></select>
					담당의 : <select name="doctor">
						<option value="a">a</option>
						<option value="b">b</option>
						<option value="c">c</option></select><br>
				</div>
				<button id = "subBtn"type="submit">글쓰기 완료</button>
			</form>
		</div>
</body>
</html>