<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Thanh toán phí phạt</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <h1>Thanh toán phí phạt</h1>

            <p class="lead">
                Ghi nhận thanh toán các khoản phí phạt phát sinh trong quá trình sử dụng thư viện.
            </p>

        </section>

        <section class="card">

            <div style="display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:10px;">

                <div>
                    <h2>Xử lý thanh toán phí phạt</h2>

                    <p class="lead">
                        Trang này hỗ trợ xác nhận thanh toán, cập nhật công nợ và lưu lịch sử giao dịch của độc giả.
                    </p>
                </div>

                <span style="
                      background:#16a34a;
                      color:white;
                      padding:8px 15px;
                      border-radius:20px;
                      font-weight:bold;">
                    Fine Payment
                </span>

            </div>

            <hr style="margin:20px 0;border:none;border-top:1px solid #e5e7eb;">

            <div class="alert alert-success">
                Hệ thống sẵn sàng tiếp nhận và xử lý các khoản thanh toán phí phạt.
            </div>

            <div class="command-actions">

                <a href="${pageContext.request.contextPath}/admin/fines"
                   class="btn btn-primary">
                    Danh sách phí phạt
                </a>

                <a href="${pageContext.request.contextPath}/admin/dashboard"
                   class="btn btn-secondary">
                    Trang chủ
                </a>

            </div>

        </section>

    </body>
</html>

