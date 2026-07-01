<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Báo cáo theo năm</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <h1>Báo cáo theo năm</h1>

            <p class="lead">
                Thống kê hoạt động thư viện theo từng năm học hoặc năm tài chính.
            </p>

        </section>

        <section class="card">

            <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:10px;">

                <div>
                    <h2>Thống kê tổng hợp theo năm</h2>

                    <p class="lead">
                        Trang này hỗ trợ quản trị viên theo dõi tình hình mượn trả sách, số lượng độc giả, doanh thu phí phạt và các chỉ số hoạt động của thư viện trong từng năm.
                    </p>
                </div>

                <span style="
                      background:#2563eb;
                      color:white;
                      padding:8px 15px;
                      border-radius:20px;
                      font-weight:bold;">
                    Yearly Report
                </span>

            </div>

            <hr style="margin:20px 0;border:none;border-top:1px solid #e5e7eb;">

            <div class="alert alert-success">
                Hệ thống đang tổng hợp dữ liệu thống kê và báo cáo theo năm.
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

