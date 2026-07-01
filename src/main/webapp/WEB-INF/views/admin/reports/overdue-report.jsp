<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Báo cáo sách quá hạn</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <h1>Báo cáo sách quá hạn</h1>

            <p class="lead">
                Thống kê các trường hợp mượn sách quá hạn trong hệ thống thư viện.
            </p>

        </section>

        <section class="card">

            <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:10px;">

                <div>
                    <h2>Thống kê phiếu mượn quá hạn</h2>

                    <p class="lead">
                        Trang này giúp quản trị viên theo dõi các phiếu mượn chưa được trả đúng hạn để có biện pháp xử lý và nhắc nhở độc giả.
                    </p>
                </div>

                <span style="
                      background:#dc2626;
                      color:white;
                      padding:8px 15px;
                      border-radius:20px;
                      font-weight:bold;">
                    Overdue Report
                </span>

            </div>

            <hr style="margin:20px 0;border:none;border-top:1px solid #e5e7eb;">

            <div class="alert alert-danger">
                Hệ thống đang tổng hợp danh sách các phiếu mượn quá hạn cần được xử lý.
            </div>

            <div class="command-actions">

                <a href="${pageContext.request.contextPath}/admin/reports"
                   class="btn btn-primary">
                    Báo cáo tổng hợp
                </a>

                <a href="${pageContext.request.contextPath}/admin/dashboard"
                   class="btn btn-secondary">
                    Trang chủ
                </a>

            </div>

        </section>

    </body>
</html>

