<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi Tiết Hóa Đơn</title>
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
        margin: 30px 0;
        text-align: center;
    }

    table {
        width: 80%;
        margin: 20px auto;
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

    a {
        font-size: 16px;
        color: #007BFF;
        text-decoration: none;
        padding: 8px 20px;
        border-radius: 4px;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    a:hover {
        background-color: #007BFF;
        color: #fff;
    }

    .container {
        max-width: 900px;
        margin: 0 auto;
        padding: 20px;
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
	.back-link a {
        display: inline-block;
        padding: 10px 20px;
        background-color: #007bff; /* Màu nền xanh dương */
        color: #fff; /* Màu chữ trắng */
        font-size: 16px;
        text-align: center;
        text-decoration: none;
        border-radius: 5px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Bóng đổ nhẹ */
        transition: background-color 0.3s ease, transform 0.2s ease; /* Hiệu ứng chuyển màu nền và nâng nút */
    }

    .back-link a:hover {
        background-color: #0056b3; /* Màu nền khi hover (xanh dương đậm hơn) */
        transform: translateY(-2px); /* Nút nâng lên nhẹ khi hover */
    }

    .back-link a:focus {
        outline: none; /* Bỏ viền khi focus */
    }

</style>

</head>
<body>
    <h2 style="text-align:center;">Hóa Đơn Của Khách Hàng ID: ${selectedCustomerId}</h2>
    <table>
        <thead>
            <tr>
                <th>ID Hóa Đơn</th>
                <th>Tổng Tiền</th>
                <th>Loại Hóa Đơn</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="invoice" items="${invoiceList}">
                <tr>
                    <td>${invoice.HD_id}</td>
                    <td>${invoice.tongtien}</td>
                    <td>${invoice.loai}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="back-link" style="text-align: center; margin-top: 20px;">
    	<a href="ThongkeKH?startDate=${startDate}&endDate=${endDate}">Quay lại danh sách khách hàng</a>
	</div>
</body>
</html>
