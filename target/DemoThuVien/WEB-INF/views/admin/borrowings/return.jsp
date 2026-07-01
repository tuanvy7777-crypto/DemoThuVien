<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Xác nhận trả sách</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <h1>Xác nhận trả sách</h1>

            <p class="lead">
                Quản lý việc trả sách và cập nhật trạng thái phiếu mượn trong hệ thống thư viện.
            </p>

        </section>

        <section class="card">

            <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:10px;">

                <div>
                    <h2>Tiếp nhận trả sách</h2>

                    <p class="lead">
                        Trang này hỗ trợ xác nhận việc trả sách của độc giả, cập nhật số lượng tồn kho và hoàn tất phiếu mượn.
                    </p>
                </div>

                <span style="
                      background:#16a34a;
                      color:white;
                      padding:8px 15px;
                      border-radius:20px;
                      font-weight:bold;">
                    Return Book
                </span>

            </div>

            <hr style="margin:20px 0;border:none;border-top:1px solid #e5e7eb;">

            <div class="alert alert-success">
                Hệ thống sẵn sàng tiếp nhận và xử lý các yêu cầu trả sách.
            </div>

            <div class="command-actions">

                <a href="${pageContext.request.contextPath}/admin/borrowings"
                   class="btn btn-primary">
                    Danh sách phiếu mượn
                </a>

                <a href="${pageContext.request.contextPath}/admin/dashboard"
                   class="btn btn-secondary">
                    Trang chủ
                </a>

            </div>

        </section>

    </body>
</html>

