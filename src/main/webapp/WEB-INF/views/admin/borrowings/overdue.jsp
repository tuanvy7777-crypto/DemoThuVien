<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Phiếu mượn quá hạn</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <h1>Phiếu mượn quá hạn</h1>

            <p class="lead">
                Theo dõi và xử lý các trường hợp mượn sách quá thời hạn quy định.
            </p>

        </section>

        <section class="card">

            <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:10px;">

                <div>
                    <h2>Danh sách phiếu mượn quá hạn</h2>

                    <p class="lead">
                        Trang này hỗ trợ quản trị viên kiểm tra các phiếu mượn chưa được trả đúng hạn và thực hiện các biện pháp xử lý phù hợp.
                    </p>
                </div>

                <span style="
                      background:#dc2626;
                      color:white;
                      padding:8px 15px;
                      border-radius:20px;
                      font-weight:bold;">
                    Overdue Records
                </span>

            </div>

            <hr style="margin:20px 0;border:none;border-top:1px solid #e5e7eb;">

            <div class="alert alert-danger">
                Hệ thống đang theo dõi các phiếu mượn quá hạn cần được xử lý.
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

