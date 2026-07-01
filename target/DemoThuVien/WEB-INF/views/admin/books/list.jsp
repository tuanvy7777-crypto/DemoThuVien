<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Quản lý sách</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <div>
                <h1>Quản lý sách</h1>

                <p class="lead">
                    Quản lý kho sách, số lượng tồn kho, tác giả, thể loại và nhà xuất bản.
                </p>
            </div>

            <div class="command-actions">
                <a class="btn btn-success"
                   href="${pageContext.request.contextPath}/admin/books/create">
                    Thêm sách
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
                        <th>Tên sách</th>
                        <th>ISBN</th>
                        <th>Thể loại</th>
                        <th>Tác giả</th>
                        <th>Nhà xuất bản</th>
                        <th>Tồn kho</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>

                <tbody>

                    <c:forEach var="book" items="${books}">
                        <tr>

                            <td>#${book.id}</td>

                            <td>
                                <strong>${book.title}</strong>
                            </td>

                            <td>${book.isbn}</td>

                            <td>${book.category}</td>

                            <td>${book.author}</td>

                            <td>${book.publisher}</td>

                            <td>
                                <span class="badge">
                                    ${book.availableQuantity}/${book.quantity}
                                </span>
                            </td>

                            <td>

                                <div class="actions-cell">

                                    <a class="btn btn-warning"
                                       href="${pageContext.request.contextPath}/admin/books/edit?id=${book.id}">
                                        Sửa
                                    </a>

                                    <form method="post"
                                          action="${pageContext.request.contextPath}/admin/books/delete"
                                          style="display:inline;">

                                        <input type="hidden"
                                               name="id"
                                               value="${book.id}">

                                        <button class="btn btn-danger"
                                                type="submit"
                                                onclick="return confirm('Bạn có chắc muốn xóa sách này?')">
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
