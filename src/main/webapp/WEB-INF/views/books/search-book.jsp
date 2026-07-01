<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Tìm kiếm sách</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <div>
                <h1>Tìm kiếm sách</h1>

                <p class="lead">
                    Tìm kiếm sách theo tên, tác giả, thể loại và sắp xếp kết quả theo nhu cầu.
                </p>
            </div>

        </section>

        <section class="card">

            <form class="filter-grid"
                  method="get"
                  action="${pageContext.request.contextPath}/books/search">

                <div class="form-row">

                    <label>Tên sách</label>

                    <input type="text"
                           name="title"
                           placeholder="Nhập tên sách">

                </div>

                <div class="form-row">

                    <label>Tác giả</label>

                    <input type="text"
                           name="author"
                           placeholder="Nhập tên tác giả">

                </div>

                <div class="form-row">

                    <label>Thể loại</label>

                    <input type="text"
                           name="category"
                           placeholder="Nhập thể loại">

                </div>

                <div class="form-row">

                    <label>Sắp xếp</label>

                    <select name="sort">
                        <option value="newest">Mới nhất</option>
                        <option value="title">Tên sách A - Z</option>
                        <option value="available">Số lượng còn lại</option>
                    </select>

                </div>

                <div class="form-row">

                    <button class="btn btn-primary"
                            type="submit">
                        Tìm kiếm
                    </button>

                </div>

            </form>

        </section>

        <section class="card">

            <table class="table">

                <thead>
                    <tr>
                        <th>Tên sách</th>
                        <th>Tác giả</th>
                        <th>Thể loại</th>
                        <th>Số lượng còn</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>

                <tbody>

                    <c:forEach var="book" items="${books}">

                        <tr>

                            <td>
                                <strong>${book.title}</strong>
                            </td>

                            <td>${book.author}</td>

                            <td>${book.category}</td>

                            <td>
                                <span class="badge">
                                    ${book.availableQuantity}
                                </span>
                            </td>

                            <td>

                                <a class="btn btn-secondary"
                                   href="${pageContext.request.contextPath}/books/detail?id=${book.id}">
                                    Xem chi tiết
                                </a>

                            </td>

                        </tr>

                    </c:forEach>

                </tbody>

            </table>

        </section>

    </body>
</html>

