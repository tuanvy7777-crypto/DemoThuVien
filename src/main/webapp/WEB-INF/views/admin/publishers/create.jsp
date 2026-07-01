<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Thêm nhà xuất bản</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <h1>Thêm nhà xuất bản</h1>

            <p class="lead">
                Tạo mới thông tin nhà xuất bản trong hệ thống quản lý thư viện.
            </p>

        </section>

        <section class="card">

            <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:10px;">

                <div>
                    <h2>Quản lý nhà xuất bản</h2>

                    <p class="lead">
                        Trang này được sử dụng để thêm mới các nhà xuất bản phục vụ cho việc quản lý và phân loại đầu sách trong thư viện.
                    </p>
                </div>

                <span style="
                      background:#16a34a;
                      color:white;
                      padding:8px 15px;
                      border-radius:20px;
                      font-weight:bold;">
                    Create Publisher
                </span>

            </div>

            <hr style="margin:20px 0;border:none;border-top:1px solid #e5e7eb;">

            <div class="alert alert-success">
                Hệ thống sẵn sàng tiếp nhận thông tin nhà xuất bản mới.
            </div>

            <div class="command-actions">

                <a href="${pageContext.request.contextPath}/admin/publishers"
                   class="btn btn-primary">
                    Danh sách nhà xuất bản
                </a>

                <a href="${pageContext.request.contextPath}/admin/dashboard"
                   class="btn btn-secondary">
                    Trang chủ
                </a>

            </div>

        </section>

    </body>
</html>

