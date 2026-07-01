<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Quản lý thể loại</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <div>
                <h1>Quản lý thể loại</h1>

                <p class="lead">
                    Tổ chức danh mục giúp độc giả tìm kiếm sách nhanh chóng và chính xác hơn.
                </p>
            </div>

            <div class="command-actions">
                <a class="btn btn-success"
                   href="${pageContext.request.contextPath}/admin/categories/create">
                    Thêm thể loại
                </a>
            </div>

        </section>

        <c:if test="${not empty success}">
            <div class="alert alert-success">
                ${success}
            </div>
        </c:if>

        <section class="card">

            <table class="table">

                <thead>
                    <tr>
                        <th>Mã</th>
                        <th>Tên thể loại</th>
                        <th>Mô tả</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>

                <tbody>

                    <c:forEach var="category" items="${categories}">

                        <tr>

                            <td>#${category.id}</td>

                            <td>
                                <strong>${category.name}</strong>
                            </td>

                            <td>${category.description}</td>

                            <td>

                                <div class="actions-cell">

                                    <a class="btn btn-warning"
                                       href="${pageContext.request.contextPath}/admin/categories/edit?id=${category.id}">
                                        Sửa
                                    </a>

                                    <form method="post"
                                          action="${pageContext.request.contextPath}/admin/categories/delete"
                                          style="display:inline;">

                                        <input type="hidden"
                                               name="id"
                                               value="${category.id}">

                                        <button class="btn btn-danger"
                                                type="submit"
                                                onclick="return confirm('Bạn có chắc muốn xóa thể loại này?')">
                                            Xóa
                                        </button>

                                    </form>

                                </div>

                            </td>

                        </tr>

                    </c:forEach>

                </tbody>

            </table>

        </section>

    </body>
</html>

