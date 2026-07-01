<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý phí phạt</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>

<section class="card">

    <div>
        <h1>Quản lý phí phạt</h1>

        <p class="lead">
            Theo dõi phí phạt, xử lý thanh toán và quản lý các khoản nợ của độc giả.
        </p>
    </div>

    <div class="command-actions">
        <button class="btn btn-success">
            Ghi nhận thanh toán
        </button>
    </div>

</section>

<section class="card">

    <table class="table">

        <thead>
        <tr>
            <th>Mã</th>
            <th>Độc giả</th>
            <th>Lý do</th>
            <th>Số tiền</th>
            <th>Trạng thái thanh toán</th>
        </tr>
        </thead>

        <tbody>

        <c:forEach var="fine" items="${fines}">

            <tr>

                <td>#${fine.id}</td>

                <td>${fine.readerName}</td>

                <td>${fine.reason}</td>

                <td>${fine.amount}</td>

                <td>

                    <span class="badge">
                        ${fine.paid ? 'Đã thanh toán' : 'Chưa thanh toán'}
                    </span>

                </td>

            </tr>

        </c:forEach>

        </tbody>

    </table>

</section>

</body>
</html>

