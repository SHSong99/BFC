<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bfc.member.UserDTO" %>
<%@ page import="com.bfc.member.UserDAO" %>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입 처리</title>
</head>
<body>
<%

// 폼에서 전송된 데이터 받기
String nickname = request.getParameter("nickname");
String login = request.getParameter("login");
String password = request.getParameter("password");

// DTO 객체 생성
UserDTO user = new UserDTO();
user.setNickname(nickname);
user.setLogin(login);
user.setPassword(password);

// DAO 객체 생성
UserDAO userDAO = new UserDAO();

// 회원 등록
boolean isSuccess = userDAO.registerUser(user);
if (isSuccess) {
    // 회원가입 성공 시 처리
%>
    <script>
        alert("회원가입이 완료되었습니다.");
        setTimeout(function() {
            window.location.href = "../member/login.jsp";
        }, 3000); // 3초 후에 리다이렉트
    </script>
<%
} else {
    // 회원가입 실패 시 처리
    response.sendRedirect("../error.jsp");
}
%>
</body>
</html>