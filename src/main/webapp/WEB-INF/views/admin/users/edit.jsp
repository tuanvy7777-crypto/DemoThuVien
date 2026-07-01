<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Chỉnh sửa người dùng</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <h1>Chỉnh sửa người dùng</h1>

            <p class="lead">
                Cập nhật thông tin tài khoản người dùng trong hệ thống quản lý thư viện.
            </p>

        </section>

        <section class="card">

            <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:10px;">

                <div>
                    <h2>Cập nhật thông tin người dùng</h2>

                    <p class="lead">
                        Trang này được sử dụng để chỉnh sửa thông tin tài khoản, quyền hạn và trạng thái hoạt động của người dùng trong hệ thống.
                    </p>
                </div>

                <span style="
                      background:#f59e0b;
                      color:white;
                      padding:8px 15px;
                      border-radius:20px;
                      font-weight:bold;">
                    Edit User
                </span>

            </div>

            <hr style="margin:20px 0;border:none;border-top:1px solid #e5e7eb;">

            <div class="alert alert-warning">
                Vui lòng kiểm tra kỹ thông tin trước khi lưu thay đổi.
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
