<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cập nhật thông tin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        .form-container h1 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
        }

        .form-container label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .form-container input, 
        .form-container select, 
        .form-container textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .form-container button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Cập nhật thông tin</h1>
        <form action="CapNhatKH" method="post" accept-charset="UTF-8">
            <input type="hidden" name="id" value="${sessionScope.id}">
            
            <label for="ho">Họ:</label>
            <input type="text" id="ho" name="ho" value="${sessionScope.ho}" required>

            <label for="tenDem">Tên đệm:</label>
            <input type="text" id="tenDem" name="tenDem" value="${sessionScope.tenDem}" required>

            <label for="ten">Tên:</label>
            <input type="text" id="ten" name="ten" value="${sessionScope.ten}" required>

            <label for="tinh">Tỉnh/Thành phố:</label>
            <select id="tinh" name="tinh" required>
                <option value="">-- Chọn tỉnh --</option>
                <option value="Hà Nội" ${sessionScope.tinh == "Hà Nội" ? "selected" : ""}>Hà Nội</option>
                <option value="TP Hồ Chí Minh" ${sessionScope.tinh == "TP Hồ Chí Minh" ? "selected" : ""}>TP Hồ Chí Minh</option>
                <option value="Đà Nẵng" ${sessionScope.tinh == "Đà Nẵng" ? "selected" : ""}>Đà Nẵng</option>
                <!-- Thêm các tỉnh khác tại đây -->
            </select>

            <label for="huyen">Huyện/Quận:</label>
            <input type="text" id="huyen" name="huyen" value="${sessionScope.huyen}" required>

            <label for="ghiChu">Ghi chú:</label>
            <textarea id="ghiChu" name="ghichu" rows="4" placeholder="Nhập ghi chú (nếu có)">${sessionScope.ghichu}</textarea>

            <button type="submit">Cập nhật</button>
        </form>
    </div>
</body>
</html>
