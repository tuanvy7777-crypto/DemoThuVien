<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html lang="vi">

    <head>

        <meta charset="UTF-8">

        <meta name="viewport"
              content="width=device-width, initial-scale=1">

        <title>${pageTitle}</title>

        <c:choose>

            <c:when test="${sessionScope.currentRole == 'LIBRARIAN'}">

                <link rel="stylesheet"
                      href="${pageContext.request.contextPath}/assets/css/style.css">

            </c:when>

            <c:when test="${sessionScope.currentRole == 'READER'}">

                <link rel="stylesheet"
                      href="${pageContext.request.contextPath}/assets/css/style-reader.css">

            </c:when>

            <c:otherwise>

                <link rel="stylesheet"
                      href="${pageContext.request.contextPath}/assets/css/style.css">

            </c:otherwise>

        </c:choose>

    </head>

    <body>

        <div class="container">

            <nav class="navbar">

                <a href="${pageContext.request.contextPath}/home">
                    Trang chủ
                </a>

                <c:choose>

                    <c:when test="${sessionScope.currentRole == 'ADMIN'}">

                        <a href="${pageContext.request.contextPath}/admin/dashboard">
                            Dashboard
                        </a>

                        <a href="${pageContext.request.contextPath}/admin/books">
                            Quản lý sách
                        </a>

                        <a href="${pageContext.request.contextPath}/admin/categories">
                            Thể loại
                        </a>

                        <a href="${pageContext.request.contextPath}/admin/authors">
                            Tác giả
                        </a>

                        <a href="${pageContext.request.contextPath}/admin/publishers">
                            Nhà xuất bản
                        </a>

                        <a href="${pageContext.request.contextPath}/admin/users">
                            Tài khoản
                        </a>

                        <a href="${pageContext.request.contextPath}/admin/borrowings">
                            Mượn trả
                        </a>

                        <a href="${pageContext.request.contextPath}/admin/fines">
                            Phí phạt
                        </a>

                        <a href="${pageContext.request.contextPath}/admin/reports/monthly">
                            Báo cáo
                        </a>

                    </c:when>

                    <c:when test="${sessionScope.currentRole == 'LIBRARIAN'}">

                        <a href="${pageContext.request.contextPath}/librarian/dashboard">
                            Dashboard
                        </a>

                        <a href="${pageContext.request.contextPath}/librarian/books">
                            Quản lý sách
                        </a>

                        <a href="${pageContext.request.contextPath}/librarian/borrowings">
                            Mượn trả
                        </a>

                        <a href="${pageContext.request.contextPath}/librarian/fines">
                            Phí phạt
                        </a>

                    </c:when>

                    <c:otherwise>

                        <a href="${pageContext.request.contextPath}/reader/dashboard">
                            Dashboard
                        </a>

                        <a href="${pageContext.request.contextPath}/books">
                            Kho sách
                        </a>

                        <a href="${pageContext.request.contextPath}/reader/borrowed-books">
                            Sách đang mượn
                        </a>

                        <a href="${pageContext.request.contextPath}/reader/borrowing-history">
                            Lịch sử mượn
                        </a>

                        <a href="${pageContext.request.contextPath}/reader/notifications">
                            Thông báo
                        </a>

                        <a href="${pageContext.request.contextPath}/reader/fine-details">
                            Phí phạt
                        </a>

                        <a href="${pageContext.request.contextPath}/reader/profile">
                            Hồ sơ cá nhân
                        </a>

                    </c:otherwise>

                </c:choose>

                <a href="${pageContext.request.contextPath}/logout">
                    Đăng xuất
                </a>

            </nav>

            <c:if test="${not empty pageTitle}">

                <section class="card">

                    <h2>${pageTitle}</h2>

                </section>

            </c:if>

            <jsp:include page="/WEB-INF/views/${body}" />

            <footer class="card"
                    style="text-align:center;color:#777;">

                <strong>DemoThuVien</strong>

                <br>

                Hệ thống quản lý thư viện trực tuyến
                xây dựng bằng Spring MVC, JSP và MySQL.

            </footer>


        </div>

    </body>
</html>
