<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giao diện Người Dùng</title>
    <style>
        /* CSS được nhúng trực tiếp vào trang JSP */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .dashboard-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 100%;
            max-width: 400px;
        }

        .dashboard-container h1 {
            margin-bottom: 20px;
        }

        .dashboard-container .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
            display: block; 
            width: 100%; 
            text-decoration: none; /* Bỏ gạch chân */
        }

        .dashboard-container .btn:hover {
            background-color: #45a049;
        }

        .dashboard-container .btn-secondary {
            background-color: #008CBA;
        }

        .dashboard-container .btn-secondary:hover {
            background-color: #007bb5;
        }

        .logout-btn {
            background-color: #f44336;
        }

        .logout-btn:hover {
            background-color: #da190b;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h1>
		    Chào mừng, 
		    <c:choose>
		        <c:when test="${not empty sessionScope.ten}">
		            ${sessionScope.ten}
		        </c:when>
		        <c:otherwise>
		            ${sessionScope.username}
		        </c:otherwise>
		    </c:choose>!
		</h1>


        <p>Chọn chức năng bạn muốn thực hiện:</p>


        <c:choose>

		    <c:when test="${sessionScope.role == 'Khách hàng'}">
		        <a href="welcome.jsp" style="text-decoration: none;">
		            <button class="btn">Xem thông tin</button>
		        </a>
		    </c:when>

		    <c:otherwise>
		        <a href="gdNhapthongtin.jsp" style="text-decoration: none;">
		            <button class="btn">Đăng ký thành viên</button>
		        </a>
		    </c:otherwise>
		</c:choose>


        <!-- Nút Mua hàng -->
        <a href="#" style="text-decoration: none;">
            <button class="btn btn-secondary">Mua hàng</button>
        </a>

        <!-- Nút Đăng xuất -->
        <a href="logout.jsp" style="text-decoration: none;">
            <button class="btn logout-btn">Đăng xuất</button>
        </a>
    </div>
</body>
</html>
