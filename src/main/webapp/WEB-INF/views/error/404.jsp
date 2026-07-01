<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Lỗi 404 - Không tìm thấy trang</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <h1>Lỗi 404 - Không tìm thấy trang</h1>

            <p class="lead">
                Trang bạn đang tìm kiếm không tồn tại hoặc đã được di chuyển.
            </p>

        </section>

        <section class="card">

            <div class="panel-header">

                <div>

                    <h2>Không tìm thấy tài nguyên</h2>

                    <p class="lead">
                        Đường dẫn bạn truy cập không hợp lệ hoặc tài nguyên đã bị xóa khỏi hệ thống.
                        Vui lòng kiểm tra lại địa chỉ hoặc quay về trang chính để tiếp tục sử dụng dịch vụ.
                    </p>

                </div>

                <span class="badge">
                    Error 404
                </span>

            </div>

            <hr>

            <div class="command-actions">

                <a href="${pageContext.request.contextPath}/"
                   class="btn btn-primary">
                    Trang chủ
                </a>

                <a href="javascript:history.back()"
                   class="btn btn-secondary">
                    Quay lại
                </a>

            </div>

        </section>

    </body>
</html>