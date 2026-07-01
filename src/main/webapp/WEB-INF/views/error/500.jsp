<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Lỗi 500 - Lỗi hệ thống</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <h1>Lỗi 500 - Lỗi hệ thống</h1>

            <p class="lead">
                Đã xảy ra lỗi trong quá trình xử lý yêu cầu của bạn.
            </p>

        </section>

        <section class="card">

            <div class="panel-header">

                <div>

                    <h2>Lỗi máy chủ nội bộ</h2>

                    <p class="lead">
                        Hệ thống đang gặp sự cố ngoài ý muốn hoặc có lỗi trong quá trình xử lý dữ liệu.
                        Vui lòng thử lại sau hoặc liên hệ quản trị viên nếu sự cố vẫn tiếp tục xảy ra.
                    </p>

                </div>

                <span class="badge">
                    Error 500
                </span>

            </div>

            <hr>

            <div class="alert alert-danger">
                Rất tiếc, hệ thống không thể hoàn thành yêu cầu của bạn vào lúc này.
            </div>

            <div class="command-actions">

                <a href="${pageContext.request.contextPath}/"
                   class="btn btn-primary">
                    Trang chủ
                </a>

                <a href="javascript:location.reload()"
                   class="btn btn-secondary">
                    Thử lại
                </a>

            </div>

        </section>

    </body>
</html>