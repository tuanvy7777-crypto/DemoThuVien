<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Đăng ký</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <div class="login-box">

            <h2>Đăng ký độc giả</h2>

            <p class="lead">
                Tạo tài khoản mới để sử dụng các dịch vụ của thư viện.
            </p>

            <form method="post"
                  action="${pageContext.request.contextPath}/register">

                <label>Họ và tên</label>

                <input type="text"
                       name="fullName"
                       placeholder="Nhập họ và tên"
                       required>

                <label>Email</label>

                <input type="email"
                       name="email"
                       placeholder="Nhập địa chỉ email"
                       required>

                <label>Tên đăng nhập</label>

                <input type="text"
                       name="username"
                       placeholder="Nhập tên đăng nhập"
                       required>

                <label>Mật khẩu</label>

                <input type="password"
                       name="password"
                       placeholder="Nhập mật khẩu"
                       required>

                <button class="btn btn-success"
                        type="submit">
                    Tạo tài khoản
                </button>

            </form>

            <div style="margin-top:15px;text-align:center;">

                <a href="${pageContext.request.contextPath}/login">
                    Đã có tài khoản? Đăng nhập
                </a>

            </div>

        </div>

    </body>
</html>

