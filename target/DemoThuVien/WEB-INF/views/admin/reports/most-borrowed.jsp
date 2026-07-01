<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Sách được mượn nhiều nhất</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <h1>Sách được mượn nhiều nhất</h1>

            <p class="lead">
                Theo dõi các đầu sách có số lượt mượn cao nhất trong thư viện.
            </p>

        </section>

        <section class="card">

            <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:10px;">

                <div>
                    <h2>Thống kê sách phổ biến</h2>

                    <p class="lead">
                        Trang này hỗ trợ quản trị viên theo dõi những đầu sách được độc giả quan tâm và mượn nhiều nhất để phục vụ công tác quản lý và bổ sung tài liệu.
                    </p>
                </div>

                <span style="
                      background:#2563eb;
                      color:white;
                      padding:8px 15px;
                      border-radius:20px;
                      font-weight:bold;">
                    Most Borrowed Books
                </span>

            </div>

            <hr style="margin:20px 0;border:none;border-top:1px solid #e5e7eb;">

            <div class="alert alert-success">
                Hệ thống đang tổng hợp dữ liệu thống kê các đầu sách có số lượt mượn cao nhất.
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

