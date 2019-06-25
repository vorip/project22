<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#yeyakButton").click(function() {
			if ($("#yeyakDay").val() != "날짜" && $("#yeyakHour").val() != "시간") {
				var day = $("#yeyakDay").val();
				var hour = $("#yeyakHour").val();
				var date = "2019," + day + "," + hour;
				var name = $("#name").val();
				var hospital = $("#hospital").val();
				var address = $("#address").val();
				var body = $("#body").val();
				var doctor = $("#doctor").val();
				var price = $("#price").val();
				var num = $("#num").val() * 1;
				$.ajax({
					url : "yeyak.jsp",
					data : {
						"name" : name,
						"hospital" : hospital,
						"address" : address,
						"body" : body,
						"doctor" : doctor,
						"price" : price,
						"date" : date,
						"num" : num
					},
					success : function(result) {
						console.log(result);
					}
				})
			}
		})
	});
</script> -->

</body>
</html>