<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Quản Lý</title>
    <style>
        body {
		    font-family: Arial, sans-serif;
		    margin: 0;
		    padding: 0;
		    background-color: #f4f4f9;
		}
		
		.container {
		    width: 100%;
		    max-width: 600px;
		    margin: 50px auto;
		    padding: 20px;
		    background-color: #fff;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		    border-radius: 8px;
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		}
		
		h2 {
		    text-align: center;
		    color: #333;
		    margin-bottom: 30px;
		}
		
		.button {
		    display: inline-block;
		    padding: 15px;
		    font-size: 18px;
		    color: white;
		    background-color: #4CAF50;
		    border: none;
		    margin: 10px 0;
		    text-align: center;
		    border-radius: 5px;
		    cursor: pointer;
		    text-decoration: none;
		     max-width: 300px;
		}
		
		.button:hover {
		    background-color: #45a049;
		}
		
		.button-logout {
		    background-color: #f44336; /* Đổi màu nền của nút Đăng Xuất thành đỏ */
		}
		
		.button-logout:hover {
		    background-color: #e53935; /* Màu đỏ đậm hơn khi hover */
		}
		
		/* Thêm phần để các nút không bị tràn */
		.container a {
		    width: 100%;
		    text-align: center;
		}
		
		/* Responsive Design */
		@media (max-width: 600px) {
		    .container {
		        width: 90%;
		    }
		
		    h2 {
		        font-size: 24px;
		    }
		}

    </style>
</head>
<body>

    <div class="container">
        <h2>Chào Mừng Quản Lý</h2>

        <a href="gdthongkeKH.jsp" class="button">Thống Kê Khách Hàng</a>

        <a href="#" class="button">Thống Kê Mặt Hàng</a>

        <!-- Nút Đăng Xuất -->
        <a href="logout.jsp" class="button button-logout">Đăng Xuất</a>
    </div>

</body>
</html>
