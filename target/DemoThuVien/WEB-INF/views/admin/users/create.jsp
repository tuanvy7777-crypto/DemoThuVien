<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Thêm người dùng</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <h1>Thêm người dùng</h1>

            <p class="lead">
                Tạo mới tài khoản người dùng trong hệ thống quản lý thư viện.
            </p>

        </section>

        <section class="card">

            <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:10px;">

                <div>
                    <h2>Quản lý tài khoản người dùng</h2>

                    <p class="lead">
                        Trang này được sử dụng để thêm mới tài khoản quản trị viên hoặc nhân viên thư viện nhằm phục vụ công tác quản lý hệ thống.
                    </p>
                </div>

                <span style="
                      background:#16a34a;
                      color:white;
                      padding:8px 15px;
                      border-radius:20px;
                      font-weight:bold;">
                    Create User
                </span>

            </div>

            <hr style="margin:20px 0;border:none;border-top:1px solid #e5e7eb;">

            <div class="alert alert-success">
                Hệ thống sẵn sàng tiếp nhận thông tin người dùng mới.
            </div>

            <div class="command-actions">

                <a href="${pageContext.request.contextPath}/admin/users"
                   class="btn btn-primary">
                    Danh sách người dùng
                </a>

                <a href="${pageContext.request.contextPath}/admin/dashboard"
                   class="btn btn-secondary">
                    Trang chủ
                </a>

            </div>

        </section>

    </body>
</html>

