<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>${pageTitle}</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <div>
                <h1>${pageTitle}</h1>

                <p class="lead">
                    Lưu thông tin liên hệ của nhà xuất bản.
                </p>
            </div>

            <div class="command-actions">
                <a class="btn btn-secondary"
                   href="${pageContext.request.contextPath}/admin/publishers">
                    Quay lại
                </a>
            </div>

        </section>

        <section class="card">

            <form class="form"
                  method="post"
                  action="${pageContext.request.contextPath}/admin/publishers/save">

                <input type="hidden"
                       name="id"
                       value="${publisher.id}">

                <div class="form-grid">

                    <div class="form-row">
                        <label>Tên nhà xuất bản</label>

                        <input type="text"
                               name="name"
                               value="${publisher.name}"
                               placeholder="Nhập tên nhà xuất bản"
                               required>
                    </div>

                    <div class="form-row">
                        <label>Email</label>

                        <input type="email"
                               name="email"
                               value="${publisher.email}"
                               placeholder="example@gmail.com">
                    </div>

                </div>

                <div class="command-actions">

                    <button class="btn btn-success"
                            type="submit">
                        Lưu nhà xuất bản
                    </button>

                    <a class="btn btn-secondary"
                       href="${pageContext.request.contextPath}/admin/publishers">
                        Hủy
                    </a>

                </div>

            </form>

        </section>

    </body>
</html>

