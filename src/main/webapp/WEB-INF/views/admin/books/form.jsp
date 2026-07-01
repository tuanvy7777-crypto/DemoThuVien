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
            Nhập thông tin sách, phân loại và số lượng tồn kho.
        </p>
    </div>

    <div class="command-actions">
        <a class="btn btn-secondary"
           href="${pageContext.request.contextPath}/admin/books">
            Quay lại
        </a>
    </div>

</section>

<section class="card">

    <form class="form"
          method="post"
          action="${pageContext.request.contextPath}/admin/books/save">

        <input type="hidden"
               name="id"
               value="${book.id}">

        <div class="form-grid">

            <div class="form-row full">
                <label>Tên sách</label>
                <input type="text"
                       name="title"
                       value="${book.title}"
                       required>
            </div>

            <div class="form-row">
                <label>ISBN</label>
                <input type="text"
                       name="isbn"
                       value="${book.isbn}">
            </div>

            <div class="form-row">
                <label>Năm xuất bản</label>
                <input type="number"
                       name="publicationYear"
                       value="${book.publicationYear}">
            </div>

            <div class="form-row">
                <label>Thể loại</label>

                <select name="categoryId">
                    <option value="0">Chọn thể loại</option>

                    <c:forEach var="category" items="${categories}">
                        <option value="${category.id}"
                            ${category.id == book.categoryId ? 'selected' : ''}>
                            ${category.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-row">
                <label>Tác giả</label>

                <select name="authorId">
                    <option value="0">Chọn tác giả</option>

                    <c:forEach var="author" items="${authors}">
                        <option value="${author.id}"
                            ${author.id == book.authorId ? 'selected' : ''}>
                            ${author.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-row">
                <label>Nhà xuất bản</label>

                <select name="publisherId">
                    <option value="0">Chọn nhà xuất bản</option>

                    <c:forEach var="publisher" items="${publishers}">
                        <option value="${publisher.id}"
                            ${publisher.id == book.publisherId ? 'selected' : ''}>
                            ${publisher.name}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-row">
                <label>Ảnh bìa</label>

                <input type="text"
                       name="coverImage"
                       value="${book.coverImage}"
                       placeholder="cover.jpg">
            </div>

            <div class="form-row">
                <label>Số lượng</label>

                <input type="number"
                       name="quantity"
                       min="0"
                       value="${book.quantity}"
                       required>
            </div>

            <div class="form-row">
                <label>Còn lại</label>

                <input type="number"
                       name="availableQuantity"
                       min="0"
                       value="${book.availableQuantity}"
                       required>
            </div>

            <div class="form-row full">
                <label>Mô tả</label>

                <textarea name="description">${book.description}</textarea>
            </div>

        </div>

        <div class="command-actions">

            <button class="btn btn-success"
                    type="submit">
                Lưu sách
            </button>

            <a class="btn btn-secondary"
               href="${pageContext.request.contextPath}/admin/books">
                Hủy
            </a>

        </div>

    </form>

</section>

</body>
</html>
