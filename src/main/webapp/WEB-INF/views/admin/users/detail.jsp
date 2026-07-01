<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Chi tiết người dùng</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <h1>Chi tiết người dùng</h1>

            <p class="lead">
                Xem thông tin chi tiết tài khoản người dùng trong hệ thống quản lý thư viện.
            </p>

        </section>

        <section class="card">

            <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:10px;">

                <div>
                    <h2>Thông tin người dùng</h2>

                    <p class="lead">
                        Trang này hiển thị đầy đủ thông tin của người dùng, bao gồm tài khoản, vai trò và trạng thái hoạt động trong hệ thống.
                    </p>
                </div>

                <span style="
                      background:#2563eb;
                      color:white;
                      padding:8px 15px;
                      border-radius:20px;
                      font-weight:bold;">
                    User Details
                </span>

            </div>

            <hr style="margin:20px 0;border:none;border-top:1px solid #e5e7eb;">

            <div class="alert alert-info">
                Thông tin người dùng đang được hiển thị từ cơ sở dữ liệu hệ thống.
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

