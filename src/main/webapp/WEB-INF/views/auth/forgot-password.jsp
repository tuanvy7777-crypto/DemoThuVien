<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Quên mật khẩu</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <div class="login-box">

            <h2>Khôi phục mật khẩu</h2>

            <p class="lead">
                Nhập địa chỉ email để nhận liên kết đặt lại mật khẩu.
            </p>

            <form method="post">

                <label>Email</label>

                <input type="email"
                       name="email"
                       placeholder="Nhập email của bạn"
                       required>

                <button class="btn btn-primary"
                        type="submit">
                    Gửi liên kết
                </button>

            </form>

        </div>

    </body>
</html>

