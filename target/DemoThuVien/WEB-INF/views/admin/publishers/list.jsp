<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Quản lý nhà xuất bản</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <div>
                <h1>Quản lý nhà xuất bản</h1>

                <p class="lead">
                    Theo dõi và quản lý thông tin nhà xuất bản phục vụ cho việc quản lý sách trong thư viện.
                </p>
            </div>

            <div class="command-actions">
                <a class="btn btn-success"
                   href="${pageContext.request.contextPath}/admin/publishers/create">
                    Thêm nhà xuất bản
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
                        <th>Tên nhà xuất bản</th>
                        <th>Email</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>

                <tbody>

                    <c:forEach var="publisher" items="${publishers}">

                        <tr>

                            <td>#${publisher.id}</td>

                            <td>
                                <strong>${publisher.name}</strong>
                            </td>

                            <td>${publisher.email}</td>

                            <td>

                                <div class="actions-cell">

                                    <a class="btn btn-warning"
                                       href="${pageContext.request.contextPath}/admin/publishers/edit?id=${publisher.id}">
                                        Sửa
                                    </a>

                                    <form method="post"
                                          action="${pageContext.request.contextPath}/admin/publishers/delete"
                                          style="display:inline;">

                                        <input type="hidden"
                                               name="id"
                                               value="${publisher.id}">

                                        <button class="btn btn-danger"
                                                type="submit"
                                                onclick="return confirm('Bạn có chắc muốn xóa nhà xuất bản này?')">
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
