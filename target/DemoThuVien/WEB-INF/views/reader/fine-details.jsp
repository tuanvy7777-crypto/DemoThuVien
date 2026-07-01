<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Chi tiết phí phạt</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <div>
                <h1>Chi tiết phí phạt</h1>

                <p class="lead">
                    Theo dõi các khoản phí phát sinh do trả sách quá hạn hoặc vi phạm quy định của thư viện.
                </p>
            </div>

        </section>

        <section class="card">

            <table class="table">

                <thead>
                    <tr>
                        <th>Mã phí</th>
                        <th>Lý do</th>
                        <th>Số tiền</th>
                        <th>Trạng thái</th>
                    </tr>
                </thead>

                <tbody>

                    <c:forEach var="fine" items="${fines}">

                        <tr>

                            <td>#${fine.id}</td>

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