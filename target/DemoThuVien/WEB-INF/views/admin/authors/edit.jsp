<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Chỉnh sửa tác giả</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <!-- Tiêu đề -->
        <section class="card">

            <h1>Chỉnh sửa tác giả</h1>

            <p class="lead">
                Cập nhật và quản lý thông tin tác giả trong hệ thống thư viện.
            </p>

        </section>

        <!-- Nội dung -->
        <section class="card">

            <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:10px;">

                <div>
                    <h2>Chức năng cập nhật tác giả</h2>

                    <p class="lead">
                        Trang này được sử dụng để chỉnh sửa thông tin tác giả đã tồn tại trong cơ sở dữ liệu.
                    </p>
                </div>

                <span style="
                      background:#f59e0b;
                      color:white;
                      padding:8px 15px;
                      border-radius:20px;
                      font-weight:bold;">
                    Edit Mode
                </span>

            </div>

            <hr style="margin:20px 0;border:none;border-top:1px solid #e5e7eb;">

            <div class="alert alert-warning">
                Vui lòng kiểm tra thông tin trước khi lưu thay đổi.
            </div>

            <div class="command-actions">

                <a href="${pageContext.request.contextPath}/admin/authors"
                   class="btn btn-primary">
                    Danh sách tác giả
                </a>

                <a href="${pageContext.request.contextPath}/admin/dashboard"
                   class="btn btn-secondary">
                    Trang chủ
                </a>

            </div>

        </section>

    </body>
</html>

