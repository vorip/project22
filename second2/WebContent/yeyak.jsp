<%@page import="bean.ResaDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="dto" class="bean.ResaDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<% 
	/* ResaDTO dto = new ResaDTO();
	dto.setName(request.getParameter("name"));
	dto.setAddress(request.getParameter("address"));
	dto.setHospital(request.getParameter("hospital"));
	dto.setNum(1);
	dto.setBody(request.getParameter("body"));
	dto.setDoctor(request.getParameter("doctor"));
	dto.setPrice(request.getParameter("price")); */
	/*dto.setNum(Integer.parseInt(request.getParameter("num")));*/
	Calendar cal = Calendar.getInstance();
	String date = "";
	if(((cal.get(Calendar.MONTH)+1)+"").length()==1){
		date = cal.get(Calendar.YEAR) +":0"+(cal.get(Calendar.MONTH)+1)+":"+ request.getParameter("day") + ":"+ request.getParameter("hour");
	}else{
		date = cal.get(Calendar.YEAR) +":"+(cal.get(Calendar.MONTH)+1)+":"+ request.getParameter("day") + ":"+ request.getParameter("hour");
	}
	dto.setDate(date);
	out.write(dto.toString());
	
	ResaDAO dao = new ResaDAO();
	dao.insert(dto);
%>
