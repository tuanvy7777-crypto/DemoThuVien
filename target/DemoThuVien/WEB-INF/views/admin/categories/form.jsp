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
                    Cập nhật nhóm nội dung sách trong thư viện.
                </p>
            </div>

            <div class="command-actions">
                <a class="btn btn-secondary"
                   href="${pageContext.request.contextPath}/admin/categories">
                    Quay lại
                </a>
            </div>

        </section>

        <section class="card">

            <form class="form"
                  method="post"
                  action="${pageContext.request.contextPath}/admin/categories/save">

                <input type="hidden"
                       name="id"
                       value="${category.id}">

                <div class="form-grid">

                    <div class="form-row full">
                        <label>Tên thể loại</label>

                        <input type="text"
                               name="name"
                               value="${category.name}"
                               placeholder="Nhập tên thể loại"
                               required>
                    </div>

                    <div class="form-row full">
                        <label>Mô tả</label>

                        <textarea name="description"
                                  placeholder="Nhập mô tả thể loại">${category.description}</textarea>
                    </div>

                </div>

                <div class="command-actions">

                    <button class="btn btn-success"
                            type="submit">
                        Lưu thể loại
                    </button>

                    <a class="btn btn-secondary"
                       href="${pageContext.request.contextPath}/admin/categories">
                        Hủy
                    </a>

                </div>

            </form>

        </section>

    </body>
</html>

