<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thống Kê Khách Hàng</title>
    <style>  
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
            color: #333;
        }

        h2 {
            font-size: 24px;
            font-weight: 600;
            color: #333;
            margin: 20px 0;
            text-align: left;
            flex-grow: 1; /* Allow h2 to take up remaining space */
        }

        /* Thiết lập container cho tiêu đề và nút quay lại */
        .header-container {
            display: flex;
            justify-content: space-between; /* Căn chỉnh tiêu đề và nút quay lại */
            align-items: center;
            padding: 20px;
            width: 80%;
            margin: 0 auto;
        }

        .form-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 80%;
            margin: 0 auto;
            text-align: center;
        }

        .form-container input[type="date"] {
            padding: 8px;
            margin: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 200px;
        }

        .form-container button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container button:hover {
            background-color: #45a049;
        }

        table {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f4f4f4;
            color: #333;
            font-size: 16px;
        }

        td {
            font-size: 14px;
            color: #666;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        td button {
            padding: 8px 15px;
            font-size: 14px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        td button:hover {
            background-color: #0056b3;
        }

        .back-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #f44336;
            color: #fff;
            text-decoration: none;
            font-size: 16px;
            border-radius: 5px;
            text-align: center;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #e53935;
        }
    </style>
</head>
<body>
    <!-- Đổi phần tiêu đề thành container flex để căn chỉnh -->
    <div class="header-container">
        <h2>Thống Kê Khách Hàng</h2>
        <a href="gdChinhQL.jsp" class="back-button">Quay lại</a>
    </div>
    
    <!-- Form tìm kiếm -->
    <c:if test="${empty invoiceList}">
        <div class="form-container">
            <form action="ThongkeKH" method="post">
                <label for="startDate">Từ ngày:</label>
                <!-- Lấy giá trị từ request, nếu có -->
                <input type="date" id="startDate" name="startDate" value="${startDate != null ? startDate : ''}" required>
                <label for="endDate">Đến ngày:</label>
                <input type="date" id="endDate" name="endDate" value="${endDate != null ? endDate : ''}" required>
                <button type="submit">Tìm kiếm</button>
            </form>
        </div>

        <!-- Bảng thông tin khách hàng -->
        <c:if test="${not empty customerList}">
            <table>
                <thead>
                    <tr>
                        <th>ID Khách Hàng</th>
                        <th>Tên Khách Hàng</th>
                        <th>Doanh Thu</th>
                        <th>Chi Tiết</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="customer" items="${customerList}">
                        <tr>
                            <td>${customer.KH_id}</td>
                            <td>${customer.ho} ${customer.tendem} ${customer.ten}</td>
                            <td>${customer.tongtien}</td>
                            <td>
                                <form action="ChitietHD" method="post" style="margin: 0;">
                                    <input type="hidden" name="customerId" value="${customer.KH_id}">
                                    <input type="hidden" name="startDate" value="${startDate}">
                                    <input type="hidden" name="endDate" value="${endDate}">
                                    <button type="submit">Xem Chi Tiết</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </c:if>
</body>
</html>
