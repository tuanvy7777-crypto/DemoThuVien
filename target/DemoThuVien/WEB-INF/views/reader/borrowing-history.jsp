<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
                    Theo dõi lịch sử mượn sách, thời hạn trả và trạng thái các phiếu mượn.
                </p>
            </div>

            <div class="command-actions">

                <a class="btn btn-secondary"
                   href="${pageContext.request.contextPath}/books">
                    Tìm sách
                </a>

            </div>

        </section>

        <section class="card">

            <table class="table">

                <thead>
                    <tr>
                        <th>Mã phiếu</th>
                        <th>Tên sách</th>
                        <th>Ngày mượn</th>
                        <th>Hạn trả</th>
                        <th>Trạng thái</th>
                    </tr>
                </thead>

                <tbody>

                <c:forEach var="record" items="${records}">

                    <tr>

                        <td>#${record.id}</td>

                        <td>
                            <strong>${record.bookTitle}</strong>
                        </td>

                        <td>${record.borrowDate}</td>

                        <td>${record.dueDate}</td>

                        <td>
                            <span class="badge">
                                ${record.status}
                            </span>
                        </td>

                    </tr>

                </c:forEach>

                </tbody>

            </table>

        </section>

    </body>
</html>