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
                    Lưu thông tin tác giả để gắn với từng đầu sách trong thư viện.
                </p>
            </div>

            <div class="command-actions">
                <a class="btn btn-secondary"
                   href="${pageContext.request.contextPath}/admin/authors">
                    Quay lại
                </a>
            </div>

        </section>

        <section class="card">

            <form class="form"
                  method="post"
                  action="${pageContext.request.contextPath}/admin/authors/save">

                <input type="hidden"
                       name="id"
                       value="${author.id}">

                <div class="form-grid">

                    <div class="form-row">
                        <label>Tên tác giả</label>

                        <input type="text"
                               name="name"
                               value="${author.name}"
                               required>
                    </div>

                    <div class="form-row">
                        <label>Quốc tịch</label>

                        <input type="text"
                               name="nationality"
                               value="${author.nationality}">
                    </div>

                </div>

                <div class="command-actions">

                    <button class="btn btn-success"
                            type="submit">
                        Lưu tác giả
                    </button>

                    <a class="btn btn-secondary"
                       href="${pageContext.request.contextPath}/admin/authors">
                        Hủy
                    </a>

                </div>

            </form>

        </section>

    </body>
</html>

