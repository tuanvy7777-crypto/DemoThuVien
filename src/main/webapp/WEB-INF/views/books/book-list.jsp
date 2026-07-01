<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Kho sách trực tuyến</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <div>
                <h1>Kho sách trực tuyến</h1>

                <p class="lead">
                    Tra cứu sách, kiểm tra tình trạng còn sách và gửi yêu cầu mượn trực tuyến.
                </p>
            </div>

            <div class="command-actions">

                <a class="btn btn-secondary"
                   href="${pageContext.request.contextPath}/books/search">
                    Tìm kiếm nâng cao
                </a>

            </div>

        </section>

        <section class="card">

            <form class="filter-grid"
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
                           placeholder="Ví dụ: Công nghệ thông tin">
                </div>

                <div class="form-row">
                    <label>Sắp xếp</label>

                    <select name="sort">
                        <option value="newest">Mới nhất</option>
                        <option value="title">Tên sách</option>
                        <option value="available">Còn nhiều nhất</option>
                    </select>
                </div>

                <div class="form-row">
                    <button class="btn btn-primary"
                            type="submit">
                        Lọc dữ liệu
                    </button>
                </div>

            </form>

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
                            Nhà xuất bản:
                            <strong>${book.publisher}</strong>
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

    </body>
</html>

