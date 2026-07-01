<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Chi tiết sách</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <h1>Chi tiết sách</h1>

            <p class="lead">
                Xem thông tin chi tiết của sách trong hệ thống thư viện.
            </p>

        </section>

        <section class="card">

            <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:10px;">

                <div>
                    <h2>Thông tin sách</h2>

                    <p class="lead">
                        Trang này hiển thị đầy đủ thông tin của một đầu sách được lưu trong cơ sở dữ liệu.
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
                Thông tin sách đang được hiển thị từ hệ thống quản lý thư viện.
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

