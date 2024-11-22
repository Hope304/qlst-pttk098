<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Hủy session khi người dùng đăng xuất
    session.invalidate(); // Xóa tất cả thông tin phiên làm việc
    response.sendRedirect("login.jsp"); // Chuyển hướng về trang đăng nhập
%>
