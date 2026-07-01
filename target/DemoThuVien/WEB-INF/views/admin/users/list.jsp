<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Quản lý người dùng</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <div>
                <h1>Quản lý người dùng</h1>

                <p class="lead">
                    Quản lý tài khoản quản trị viên, thủ thư và độc giả trong hệ thống thư viện.
                </p>
            </div>

            <div class="command-actions">
                <a class="btn btn-success"
                   href="${pageContext.request.contextPath}/admin/users/create">
                    Thêm người dùng
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
                        <th>Họ và tên</th>
                        <th>Tài khoản</th>
                        <th>Email</th>
                        <th>Điện thoại</th>
                        <th>Vai trò</th>
                        <th>Trạng thái</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>

                <tbody>

                    <c:forEach var="user" items="${users}">

                        <tr>

                            <td>#${user.id}</td>

                            <td>
                                <strong>${user.fullName}</strong>
                            </td>

                            <td>${user.username}</td>

                            <td>${user.email}</td>

                            <td>${user.phone}</td>

                            <td>
                                <span class="badge">
                                    ${user.role}
                                </span>
                            </td>

                            <td>${user.status}</td>

                            <td>

                                <div class="actions-cell">

                                    <a class="btn btn-warning"
                                       href="${pageContext.request.contextPath}/admin/users/edit?id=${user.id}">
                                        Sửa
                                    </a>

                                    <form method="post"
                                          action="${pageContext.request.contextPath}/admin/users/delete"
                                          style="display:inline;">

                                        <input type="hidden"
                                               name="id"
                                               value="${user.id}">

                                        <button class="btn btn-danger"
                                                type="submit"
                                                onclick="return confirm('Bạn có chắc muốn xóa người dùng này?')">
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

