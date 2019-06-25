<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/*절대경로를 알아보기*/
String uploadPath = "D:/CHY/java_src/second/WebContent/uploadFile";
/* out.println("절대경로 : " + uploadPath+ "<br>"); */

int maxSize = 1024*1024*10; //한번에 올릴 수 있는 파일용량 : 10mb

String name = "";
 
String fileName1 = ""; // 중복처리된 이름
String originalName1 = ""; // 중복 처리전 실제 원본 이름
long fileSize = 0; // 파일 사이즈
String fileType = ""; // 파일 타입
 
MultipartRequest multi = null;
 
try{
    // request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
    multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
     
    // form내의 input name="name" 인 녀석 value를 가져옴
    name = multi.getParameter("file");
     
    // 전송한 전체 파일이름들을 가져옴
    Enumeration files = multi.getFileNames();
     
    while(files.hasMoreElements()){
        // form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
        String file1 = (String)files.nextElement(); // 파일 input에 지정한 이름을 가져옴
        // 그에 해당하는 실재 파일 이름을 가져옴
        originalName1 = multi.getOriginalFileName(file1);
        // 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
        // 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
        fileName1 = multi.getFilesystemName(file1);
        // 파일 타입 정보를 가져옴
        fileType = multi.getContentType(file1);
        // input file name에 해당하는 실재 파일을 가져옴
        File file = multi.getFile(file1);
        // 그 파일 객체의 크기를 알아냄
        fileSize = file.length();
    }
}catch(Exception e){
    e.printStackTrace();
}
%>
<!--해당 페이지는 사용자에게 보여줄 필요가 없고 해당 정보를 전달만 해주면 되기 때문에 hidden으로 했다.-->
	<form action="fileCheck.jsp" method="post" name="fileCheckFormName">
	    <input type="hidden" value="<%=name%>" name="name" />
	    <input type="hidden" value="<%=fileName1%>" name="fileName1" />
	    <input type="hidden" value="<%=originalName1%>" name="originalName1" />
	</form>
	
	<%
        // post방식에 대한 한글 인코딩 방식 지정 get방식은 서버의 server.xml에서 Connector태그에 URIEncoding="UTF-8" 추가
        request.setCharacterEncoding("UTF-8");
         
        // 중복방지용으로 만들어져 넘겨진 파일명을 가져옴
        // 본래의 파일명을 가져옴
    %>
     
    <!-- <h3>업로드 파일 확인</h3> -->
     
    <!-- 파일 다운로드 링크 클릭시 다운로드 될 수 있도록 fileDown1.jsp 페이지에서 처리 뒤에 쿼리문자열을 통해 중복 방지용 이름 fileName1 값을 같이 넘겨준다. -->
   <%--  파일1 다운로드 : <a id="downA" href="#"><%=originalName1%></a>
    <script type="text/javascript">
        // 영문파일은 그냥 다운로드 클릭시 정상작동하지만 한글파일명을 쿼리문으로 날릴경우 인코딩 문제가 발생할 수 있다. 한글이 깨져 정상작동하지 않을 수 있음
        // 따라서, 쿼리문자열에 한글을 보낼 때는 항상 인코딩을 해서 보내주도록 하자.
        document.getElementById("downA").addEventListener("click", function(event) {
            event.preventDefault(); // a 태그의 기본 동작을 막음
            event.stopPropagation(); // 이벤트의 전파를 막음
            // fileName1을 utf-8로 인코딩한다.
            var fName = encodeURIComponent("<%=fileName1%>");
            // 인코딩된 파일이름을 쿼리문자열에 포함시켜 다운로드 페이지로 이동
            window.location.href = "fileDown1.jsp?file_name="+fName;
        });
    </script> --%>

</body>
</html>