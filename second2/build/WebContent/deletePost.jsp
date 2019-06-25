<%@page import="bean.NoticeDAO"%>
<%@page import="bean.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert("글이 삭제되었습니다.");
	location.href = "notice2.jsp?index=0";
</script>
</head>
<body>
	<%
		String info1 = request.getParameter("info");
		String[] info = info1.split(",");
		NoticeDTO dto = new NoticeDTO();
		dto.setTitle(info[0]);
		dto.setName(info[1]);
		dto.setContent(info[2]);
		dto.setTime(info[3]);
		NoticeDAO dao = new NoticeDAO();
		dao.delete(dto);
	%>
	<%-- <%= dto %> --%>

</body>
</html>