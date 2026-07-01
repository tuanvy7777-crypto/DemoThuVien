<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Duyệt yêu cầu mượn sách</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <h1>Duyệt yêu cầu mượn sách</h1>

            <p class="lead">
                Xem xét và phê duyệt các yêu cầu mượn sách trong hệ thống thư viện.
            </p>

        </section>

        <section class="card">

            <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:10px;">

                <div>
                    <h2>Quản lý yêu cầu mượn sách</h2>

                    <p class="lead">
                        Trang này được sử dụng để kiểm tra, phê duyệt hoặc từ chối các yêu cầu mượn sách của độc giả.
                    </p>
                </div>

                <span style="
                      background:#16a34a;
                      color:white;
                      padding:8px 15px;
                      border-radius:20px;
                      font-weight:bold;">
                    Borrowing Approval
                </span>

            </div>

            <hr style="margin:20px 0;border:none;border-top:1px solid #e5e7eb;">

            <div class="alert alert-success">
                Hệ thống sẵn sàng xử lý các yêu cầu mượn sách đang chờ duyệt.
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

