<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>${book.title}</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <div>
                <h1>${book.title}</h1>

                <p class="lead">
                    ISBN: ${book.isbn}
                </p>
            </div>

            <div class="command-actions">

                <a class="btn btn-success"
                   href="${pageContext.request.contextPath}/borrow/request">
                    Mượn sách
                </a>

                <a class="btn btn-secondary"
                   href="${pageContext.request.contextPath}/books">
                    Quay lại kho sách
                </a>

            </div>

        </section>

        <section class="book-detail-layout">

            <div class="book-detail-cover">

                <c:if test="${not empty book.coverImage}">
                    <img src="${pageContext.request.contextPath}/assets/images/${book.coverImage}"
                         alt="${book.title}">
                </c:if>

            </div>

            <article class="card">

                <div class="panel-header">

                    <div>
                        <h2>Thông tin sách</h2>

                        <p class="lead">
                            Thông tin chi tiết và tình trạng hiện tại của đầu sách.
                        </p>
                    </div>

                    <span class="badge">
                        ${book.availableQuantity > 0 ? 'Còn sách' : 'Hết sách'}
                    </span>

                </div>

                <div class="book-meta-grid">

                    <div class="book-meta-item">
                        <strong>Tác giả</strong>
                        <p>${book.author}</p>
                    </div>

                    <div class="book-meta-item">
                        <strong>Thể loại</strong>
                        <p>${book.category}</p>
                    </div>

                    <div class="book-meta-item">
                        <strong>Nhà xuất bản</strong>
                        <p>${book.publisher}</p>
                    </div>

                    <div class="book-meta-item">
                        <strong>Năm xuất bản</strong>
                        <p>${book.publicationYear}</p>
                    </div>

                    <div class="book-meta-item">
                        <strong>Số lượng còn lại</strong>
                        <p>${book.availableQuantity}/${book.quantity} quyển</p>
                    </div>

                    <div class="book-meta-item">
                        <strong>Đánh giá</strong>
                        <p class="rating-stars">★★★★★</p>
                    </div>

                </div>

                <hr>

                <h2>Mô tả sách</h2>

                <p>
                    ${book.description}
                </p>

            </article>

        </section>

    </body>
</html>

