<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Đăng nhập</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <div class="login-box">

            <h2>Đăng nhập</h2>

            <p class="lead">
                Vui lòng đăng nhập để truy cập hệ thống quản lý thư viện.
            </p>

            <c:if test="${not empty error}">
                <div class="alert alert-danger">
                    ${error}
                </div>
            </c:if>

            <form method="post"
                  action="${pageContext.request.contextPath}/login">

                <label>Tên đăng nhập</label>

                <input type="text"
                       name="username"
                       placeholder="Nhập tên đăng nhập"
                       required
                       autofocus>

                <label>Mật khẩu</label>

                <input type="password"
                       name="password"
                       placeholder="Nhập mật khẩu"
                       required>

                <button class="btn btn-primary"
                        type="submit">
                    Đăng nhập
                </button>

            </form>

            <div style="margin-top:15px;text-align:center;">
                <a href="${pageContext.request.contextPath}/forgot-password">
                    Quên mật khẩu?
                </a>
            </div>

        </div>

    </body>
</html>

