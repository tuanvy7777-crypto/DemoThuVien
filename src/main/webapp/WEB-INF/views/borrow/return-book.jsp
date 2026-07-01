<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Trả sách</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <div>
                <h1>Trả sách</h1>

                <p class="lead">
                    Xác nhận việc trả sách và cập nhật số lượng sách trong thư viện.
                </p>
            </div>

        </section>

        <section class="card">

            <table class="table">

                <thead>
                    <tr>
                        <th>Mã phiếu</th>
                        <th>Độc giả</th>
                        <th>Tên sách</th>
                        <th>Hạn trả</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>

                <tbody>

                    <c:forEach var="record" items="${records}">

                        <tr>

                            <td>#${record.id}</td>

                            <td>${record.readerName}</td>

                            <td>${record.bookTitle}</td>

                            <td>${record.dueDate}</td>

                            <td>

                                <form method="post"
                                      action="${pageContext.request.contextPath}/borrow/return">

                                    <input type="hidden"
                                           name="id"
                                           value="${record.id}">

                                    <button class="btn btn-success"
                                            type="submit"
                                            onclick="return confirm('Xác nhận độc giả đã trả sách?')">
                                        Xác nhận trả
                                    </button>

                                </form>

                            </td>

                        </tr>

                    </c:forEach>

                </tbody>

            </table>

        </section>

    </body>
</html>