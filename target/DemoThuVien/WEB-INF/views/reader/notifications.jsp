<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Thong bao cua doc gia</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <h1>Thong bao cua doc gia</h1>

            <p class="lead">
                Theo doi cac thong bao quan trong tu thu vien.
            </p>

        </section>

        <section class="card">

            <div class="panel-header">
                <div>
                    <h2>Danh sach thong bao</h2>
                    <p class="lead">
                        Du lieu duoc lay tu bang Notifications theo tai khoan dang dang nhap.
                    </p>
                </div>

                <span class="badge">Notifications</span>
            </div>

            <hr>

            <div style="display:grid;gap:15px;">

                <c:forEach var="notification" items="${notifications}">
                    <div class="card">
                        <strong>${notification.title}</strong>
                        <p>${notification.message}</p>
                        <span class="badge">${notification.status}</span>
                    </div>
                </c:forEach>

                <c:if test="${empty notifications}">
                    <p class="lead">Chua co thong bao nao.</p>
                </c:if>

            </div>

            <div class="command-actions" style="margin-top:20px;">

                <a href="${pageContext.request.contextPath}/reader/dashboard"
                   class="btn btn-primary">
                    Dashboard
                </a>

                <a href="${pageContext.request.contextPath}/books"
                   class="btn btn-secondary">
                    Tim sach
                </a>

            </div>

        </section>

    </body>
</html>
