<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Thêm sách mới</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <h1>Thêm sách mới</h1>

            <p class="lead">
                Quản lý và cập nhật dữ liệu sách trong hệ thống thư viện.
            </p>

        </section>

        <section class="card">

            <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:10px;">

                <div>
                    <h2>Chức năng tạo mới sách</h2>

                    <p class="lead">
                        Tại đây quản trị viên có thể thêm đầu sách mới vào cơ sở dữ liệu thư viện.
                    </p>
                </div>

                <span style="
                      background:#16a34a;
                      color:white;
                      padding:8px 15px;
                      border-radius:20px;
                      font-weight:bold;">
                    Thêm sách mới
                </span>

            </div>

            <hr style="margin:20px 0;border:none;border-top:1px solid #e5e7eb;">

            <div class="alert alert-success">
                Hệ thống sẵn sàng tiếp nhận thông tin sách mới.
            </div>

            <div class="command-actions">

                <a href="${pageContext.request.contextPath}/admin/books"
                   class="btn btn-primary">
                    Danh sách sách
                </a>

                <a href="${pageContext.request.contextPath}/admin/dashboard"
                   class="btn btn-secondary">
                    Trang chủ
                </a>

            </div>

        </section>

    </body>
</html>
