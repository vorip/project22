<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		//댓글 불러오는 ajax
		$(document).ready();
		var alComment = $("#alComment").val().split(":");
		var count = 0;
		count = alComment.length;
		$("#count").val(count+"");
		for (var i = 0; i < alComment.length; i++) {
			if(i!=0){
			$("#commentUl").append("<li>"+alComment[i]+"</li>");
			}
		}
			$("#commentDiv").css("height",(250+count*25)+"px");
			$("#commentVal").val($("#alComment").val());
		//댓글 추가하는 이벤트와 메소드
		$("#comment").click(function (){
			var com = $("#commentCon").val();
			var com1 = $("#commentVal").val();
			if(com!=""){
				count++;
				$("#commentUl").append("<li>"+com+"</li>");
				$("#commentDiv").css("height",(250+count*25)+"px")
				$("#count").val(count+"");
				if(com1!=""){
					$("#commentVal").val(com1+":"+com);
					$(document).ready();
				}else{
					$("#commentVal").val(com);
					$(document).ready();
				}
				var comment = $("#commentVal").val();
				var content = $("#content").text();
				var time = $("#time").text();
				var name = $("#name").text();
				var title = $("#title").text();
				$.ajax({
					url : "commentAdd.jsp",
					data :{
						"comment" : comment,
						"content" : content,
						"time" : time,
						"name" : name,
						"title" : title
					},
					success:function (result){
						console.log(result);
					}
				})
			}
		});
	});
</script>
<link href="bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- 상단 메뉴바 -->
	<center><div>
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
		</div></center>
		


<!-- 게시글 불러오기  -->
	<%
		String info = request.getParameter("info");
		String[] info2 = info.split(",");
		String[] fonts = info2[5].split(":");
	%>
	<div class = "container" style="display: block; margin-left: auto;margin-right: auto;">
		<div class="row" style="">
        	<div class="col-lg-8 col-md-10 mx-auto">	
				<ul class="list-group list-group-flush">
					 <li class="list-group-item" style="padding-top: 9px; padding-bottom : 9px;">
							<table>
			 					<tr>
			 						<td id = "title" style="font: 17px 굴림; font-weight: bold;"><%= info2[0] %></td>
			 						<td style="padding-left: 10px; padding-right: 10px; font:15px 굴림; color: #a1a1a1;">|</td>
			 						<td style="font: 15px 굴림;"><a style="color: #a1a1a1;" href = "contact.jsp?index=0">■ 건의사항</a></td>
			 					</tr>
			 				</table>
					 </li>
					 <li class="list-group-item" style="padding-top: 7px; padding-bottom : 7px;">
			 			<table>
			 				<tr>
			 					<td style="font-size: 13px; padding-right: 10px;">작성자 :</td>
			 					<td id = "name" style="padding: 0px; font-size : 14px"><%= info2[1] %></td>
			 					<td style="font-size: 12px; padding-right: 12px; padding-left: 12px; color: #a1a1a1;">|</td>
			 					<td style="font-size: 13px;padding-right: 20px;">날짜 :</td>
			 					<td id = "time"style="font-size: 14px;"><%= info2[3] %></td>
			 				</tr>
			 			</table>
					 </li>
					 <li class="list-group-item">
					 	<table>
					 		<tr>
					 			<td id = "content"height = "250" style="font-size: '<%= fonts[1] %>'; font-family: '<%= fonts[0] %>';font-weight: '<%= fonts[2] %>'; text-align: '<%= fonts[3] %>';"><%= info2[2] %></td>
					 		</tr>
					 	</table>
					 </li>
				</ul>
				<br>
				<div id="commentDiv"style="background: gray; border: 2px; width: 800px; height: 200px; position: relative;">
					<p>댓글</p>
					<ul id="commentUl" type="none">
					</ul>
					<div id="commentDiv">
						<input id="commentCon" type ="text" style="margin-top: 80px; width: 600px; height: 60px; margin-left: 60px;">
						<input id="commentVal" type="hidden" value="">
						<input type ="hidden" value = "0" id = "count">
						<button id = "comment" style = "height: 60px;">작성완료</button>
						<input id="alComment" type="hidden" value="<%= info2[6] %>">
					</div>
				</div>
				<form action = "deletePost.jsp">
					<input type = "hidden" name="info" value = "<%= info %>">
					<button type = "submit">삭제</button>
				</form>
				<form action ="updatePost.jsp">
					<button type = "submit">수정</button>
				</form>
			</div>
		</div>
	</div>

</body>
</html>