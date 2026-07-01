<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, initial-scale=1">

        <title>Trang chủ thư viện</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="library-header">

            <div class="library-logo">

                <span class="library-logo-icon">
                    L
                </span>

                <span>
                    DemoThuVien
                </span>

            </div>

            <form class="quick-search"
                  method="get"
                  action="${pageContext.request.contextPath}/books/search">

                <input type="text"
                       name="keyword"
                       placeholder="Tìm nhanh theo tên sách, tác giả hoặc ISBN">

                <button class="btn btn-primary"
                        type="submit">
                    Tìm kiếm
                </button>

            </form>

        </section>

        <nav class="library-nav">

            <a href="${pageContext.request.contextPath}/home">
                Trang chủ
            </a>

            <a href="${pageContext.request.contextPath}/books/category">
                Danh mục sách
            </a>

            <a href="${pageContext.request.contextPath}/books">
                Kho sách
            </a>

            <a href="${pageContext.request.contextPath}/admin/reports/most-borrowed">
                Sách mượn nhiều
            </a>

            <a href="${pageContext.request.contextPath}/reader/profile">
                Tài khoản
            </a>

        </nav>

        <section class="site-hero">

            <div>

                <h1>
                    Hệ thống thư viện trực tuyến
                </h1>

                <p>
                    Tra cứu sách, theo dõi tồn kho, quản lý mượn trả và hỗ trợ độc giả trên một nền tảng hiện đại.
                </p>

                <div class="command-actions"
                     style="margin-top:22px;">

                    <a class="btn btn-success"
                       href="${pageContext.request.contextPath}/books">
                        Khám phá kho sách
                    </a>

                    <a class="btn btn-secondary"
                       href="${pageContext.request.contextPath}/login">
                        Đăng nhập
                    </a>

                </div>

            </div>

            <aside class="hero-notice">

                <span class="badge">
                    Thông báo thư viện
                </span>

                <h2 style="color:#ffffff;">
                    Ưu tiên xử lý sách quá hạn
                </h2>

                <p>
                    Theo dõi báo cáo sách quá hạn và hỗ trợ xử lý nhanh các trường hợp cần thu hồi.
                </p>

            </aside>

        </section>

        <section class="grid stats">

            <c:forEach var="item" items="${overview}">

                <article class="card stat">

                    <span>${item.key}</span>

                    <b>${item.value}</b>

                </article>

            </c:forEach>

        </section>

        <section class="card"
                 style="margin-top:24px;">

            <div>

                <h1>Sách nổi bật</h1>

                <p class="lead">
                    Các đầu sách nổi bật hiện có trong thư viện.
                </p>

            </div>

        </section>

        <section class="library-book-grid">

            <c:forEach var="book" items="${books}">

                <article class="book-card">

                    <div class="book-card-cover">

                        <c:if test="${not empty book.coverImage}">
                            <img src="${pageContext.request.contextPath}/assets/images/${book.coverImage}"
                                 alt="${book.title}">
                        </c:if>

                    </div>

                    <div class="book-card-body">

                        <h2 class="book-card-title">
                            ${book.title}
                        </h2>

                        <p class="book-card-author">
                            ${book.author} • ${book.category}
                        </p>

                        <p>
                            Tồn kho:
                            <span class="badge">
                                ${book.availableQuantity}/${book.quantity}
                            </span>
                        </p>

                        <div class="book-card-actions">

                            <a class="btn btn-secondary"
                               href="${pageContext.request.contextPath}/books/detail?id=${book.id}">
                                Chi tiết
                            </a>

                            <a class="btn btn-success"
                               href="${pageContext.request.contextPath}/borrow/request">
                                Mượn sách
                            </a>

                        </div>

                    </div>

                </article>

            </c:forEach>

        </section>

        <footer class="library-footer">

            <div>

                <h2 style="color:#ffffff;">
                    DemoThuVien
                </h2>

                <p>
                    Hệ thống quản lý thư viện trực tuyến dành cho trường học và thư viện quy mô nhỏ.
                </p>

            </div>

            <div>

                <h3>Liên hệ</h3>

                <p>Email: library@uef.edu.vn</p>

                <p>Hotline: 0900 000 001</p>

            </div>

            <div>

                <h3>Thông tin</h3>

                <p>
                    <a href="#">
                        Quy định mượn sách
                    </a>
                </p>

                <p>
                    <a href="#">
                        Bản quyền © DemoThuVien
                    </a>
                </p>

            </div>

        </footer>

    </body>
</html>