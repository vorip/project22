<%@page import="bean.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="bean.NoticeDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	/* String comment = request.getParameter("data1");
	String content = request.getParameter("data2");
	String time = request.getParameter("data3");
	String name = request.getParameter("data4"); */
	NoticeDAO dao = new NoticeDAO();
	dao.addComment(dto);
	
%>
