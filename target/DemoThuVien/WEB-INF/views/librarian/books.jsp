<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<section class="card">

    <div class="panel-header">

        <div>
            <h1>Quản lý sách</h1>

            <p class="lead">
                Theo dõi số lượng sách và cập nhật tình trạng đầu sách.
            </p>
        </div>

        <div class="command-actions">
            <a class="btn btn-success"
               href="${pageContext.request.contextPath}/admin/books/create">
                Thêm sách
            </a>
        </div>

    </div>

</section>

<c:if test="${not empty success}"> <div class="message-success">
        ${success} </div>
    </c:if>

<section class="card">

    <table>

        <thead>
            <tr>
                <th>Mã</th>
                <th>Tên sách</th>
                <th>ISBN</th>
                <th>Tác giả</th>
                <th>Thể loại</th>
                <th>NXB</th>
                <th>Năm XB</th>
                <th>Tồn kho</th>
                <th>Trạng thái</th>
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

                    <td>${book.author}</td>

                    <td>${book.category}</td>

                    <td>${book.publisher}</td>

                    <td>${book.publicationYear}</td>

                    <td>
                        <span class="badge">
                            ${book.availableQuantity}/${book.quantity}
                        </span>
                    </td>

                    <td>
                        <c:choose>

                            <c:when test="${book.availableQuantity > 0}">
                                <span class="badge">
                                    Còn sách
                                </span>
                            </c:when>

                            <c:otherwise>
                                <span class="badge">
                                    Hết sách
                                </span>
                            </c:otherwise>

                        </c:choose>
                    </td>

                    <td>

                        <div class="actions-cell">

                            <a class="btn"
                               href="${pageContext.request.contextPath}/admin/books/edit?id=${book.id}">
                                Sửa
                            </a>

                            <a class="btn secondary"
                               href="${pageContext.request.contextPath}/books/detail?id=${book.id}">
                                Chi tiết
                            </a>

                        </div>

                    </td>

                </tr>

            </c:forEach>

        </tbody>

    </table>

</section>
