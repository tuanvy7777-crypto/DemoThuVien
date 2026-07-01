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

        <div class="card">

            <h1>${pageTitle}</h1>

            <p class="lead">
                Lưu thông tin tác giả để gắn với từng đầu sách trong thư viện.
            </p>

            <div class="command-actions">
                <a class="btn btn-secondary"
                   href="${pageContext.request.contextPath}/admin/authors">
                    Quay lại danh sách
                </a>
            </div>

        </div>

        <div class="card">

            <form class="form"
                  method="post"
                  action="${pageContext.request.contextPath}/admin/authors/save">

                <input type="hidden"
                       name="id"
                       value="${author.id}">

                <div class="form-grid">

                    <div class="form-row">
                        <label for="name">Tên tác giả</label>

                        <input id="name"
                               type="text"
                               name="name"
                               value="${author.name}"
                               placeholder="Nhập tên tác giả"
                               required>
                    </div>

                    <div class="form-row">
                        <label for="nationality">Quốc tịch</label>

                        <input id="nationality"
                               type="text"
                               name="nationality"
                               value="${author.nationality}"
                               placeholder="Nhập quốc tịch">
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

        </div>

    </body>
</html>

