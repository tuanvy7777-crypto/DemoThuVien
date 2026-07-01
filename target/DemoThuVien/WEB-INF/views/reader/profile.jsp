<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Hồ sơ độc giả</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <div>
                <h1>Hồ sơ độc giả</h1>

                <p class="lead">
                    Xem và quản lý thông tin tài khoản của bạn trong hệ thống thư viện.
                </p>
            </div>

        </section>

        <section class="card">

            <table class="table">

                <thead>
                    <tr>
                        <th>Họ và tên</th>
                        <th>Tên đăng nhập</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Vai trò</th>
                    </tr>
                </thead>

                <tbody>

                <c:forEach var="user" items="${users}">

                    <c:if test="${user.role == 'READER'}">

                        <tr>

                            <td>
                                <strong>${user.fullName}</strong>
                            </td>

                            <td>${user.username}</td>

                            <td>${user.email}</td>

                            <td>${user.phone}</td>

                            <td>
                                <span class="badge">
                                    Độc giả
                                </span>
                            </td>

                        </tr>

                    </c:if>

                </c:forEach>

                </tbody>

            </table>

        </section>

        <section class="card">

            <div class="command-actions">

                <a href="${pageContext.request.contextPath}/reader/dashboard"
                   class="btn btn-primary">
                    Dashboard
                </a>

                <a href="${pageContext.request.contextPath}/books"
                   class="btn btn-secondary">
                    Kho sách
                </a>

            </div>

        </section>

    </body>
</html>