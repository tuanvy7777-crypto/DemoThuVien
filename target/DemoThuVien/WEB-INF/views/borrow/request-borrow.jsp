<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Yeu cau muon sach</title>
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">
            <div>
                <h1>Yeu cau muon sach</h1>
                <p class="lead">Gui yeu cau muon sach va theo doi trang thai phe duyet tu thu vien.</p>
            </div>
        </section>

        <section class="card">
            <form class="form"
                  method="post"
                  action="${pageContext.request.contextPath}/borrow/request">

                <div class="form-row">
                    <label>Sach muon</label>
                    <c:choose>
                        <c:when test="${not empty selectedBook and selectedBook.id > 0}">
                            <input type="hidden" name="bookId" value="${selectedBook.id}">
                            <input type="text" value="${selectedBook.title}" readonly>
                        </c:when>
                        <c:otherwise>
                            <select name="bookId" required>
                                <c:forEach var="book" items="${books}">
                                    <option value="${book.id}">${book.title}</option>
                                </c:forEach>
                            </select>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="form-row">
                    <label>So luong</label>
                    <input type="number" name="quantity" value="1" min="1" required>
                </div>

                <div class="form-row">
                    <label>Ghi chu</label>
                    <textarea name="note" rows="4" placeholder="Nhap ghi chu neu co"></textarea>
                </div>

                <div class="command-actions">
                    <button class="btn btn-success" type="submit">Gui yeu cau</button>
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/books">Chon sach khac</a>
                </div>
            </form>
        </section>

        <section class="card">
            <h2>Lich su yeu cau muon sach</h2>

            <table class="table">
                <thead>
                    <tr>
                        <th>Ma yeu cau</th>
                        <th>Doc gia</th>
                        <th>Ten sach</th>
                        <th>Ngay yeu cau</th>
                        <th>Trang thai</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="request" items="${requests}">
                        <tr>
                            <td>#${request.id}</td>
                            <td>${request.readerName}</td>
                            <td>${request.bookTitle}</td>
                            <td>${request.requestDate}</td>
                            <td><span class="badge">${request.status}</span></td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty requests}">
                        <tr>
                            <td colspan="5">Ban chua co yeu cau muon sach nao.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </section>

    </body>
</html>
