<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Thêm tác giả</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <!-- Tiêu đề -->
        <section class="card">

            <h1>Thêm tác giả</h1>

            <p class="lead">
                Quản lý thông tin tác giả trong hệ thống thư viện.
            </p>

        </section>

        <!-- Nội dung -->
        <section class="card">

            <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:10px;">

                <div>
                    <h2>Chức năng tạo mới tác giả</h2>

                    <p class="lead">
                        Tại đây người quản trị có thể thêm tác giả mới để liên kết với các đầu sách trong thư viện.
                    </p>
                </div>

                <span style="
                      background:#2563eb;
                      color:white;
                      padding:8px 15px;
                      border-radius:20px;
                      font-weight:bold;">
                    DemoThuVien
                </span>

            </div>

            <hr style="margin:20px 0;border:none;border-top:1px solid #e5e7eb;">

            <div class="alert alert-success">
                Hệ thống đang sẵn sàng tiếp nhận dữ liệu tác giả mới.
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

