
<%@page import="bean.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert("글쓰기가 완료되었습니다!!");
	/* location.href="notice.jsp?index=0"; */
</script>
</head>
<body>
	<jsp:useBean id="dto" class="bean.NoticeDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto"/>
	<%
		


	
		NoticeDAO dao = new NoticeDAO();
		String font1 = request.getParameter("font_family");
		String font2 = request.getParameter("font_size");
		String font3 = request.getParameter("font_weight");
		String font4 = request.getParameter("font");
		String font = font1+":"+font2+":"+font3+":"+font4;
		dto.setFont(font);
		dao.insert(dto);
	%>
	
	 
	
	
	
</body>
</html>