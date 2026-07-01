<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Lỗi 403 - Truy cập bị từ chối</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <h1>Lỗi 403 - Truy cập bị từ chối</h1>

            <p class="lead">
                Bạn không có quyền truy cập vào tài nguyên hoặc chức năng này.
            </p>

        </section>

        <section class="card">

            <div class="panel-header">

                <div>

                    <h2>Không đủ quyền truy cập</h2>

                    <p class="lead">
                        Tài khoản hiện tại không được cấp quyền thực hiện thao tác này.
                        Vui lòng đăng nhập bằng tài khoản phù hợp hoặc liên hệ quản trị viên hệ thống.
                    </p>

                </div>

                <span class="badge">
                    Error 403
                </span>

            </div>

            <hr>

            <div class="command-actions">

                <a href="${pageContext.request.contextPath}/"
                   class="btn btn-primary">
                    Trang chủ
                </a>

                <a href="${pageContext.request.contextPath}/login"
                   class="btn btn-secondary">
                    Đăng nhập lại
                </a>

            </div>

        </section>

    </body>
</html>