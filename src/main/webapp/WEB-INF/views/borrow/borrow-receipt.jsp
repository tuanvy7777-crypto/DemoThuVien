<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Bien nhan muon sach</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <div>
                <h1>Bien nhan muon sach</h1>

                <p class="lead">
                    Thong tin giao dich muon sach cua doc gia.
                </p>
            </div>

            <div class="command-actions">

                <button class="btn btn-primary">
                    Xuat PDF
                </button>

            </div>

        </section>

        <c:set var="record" value="${records[0]}" />

        <section class="card">

            <c:choose>
                <c:when test="${not empty record}">
                    <h2>Phieu muon #${record.id}</h2>

                    <div class="book-meta-grid">

                        <div class="book-meta-item">
                            <strong>Doc gia</strong>
                            <p>${record.readerName}</p>
                        </div>

                        <div class="book-meta-item">
                            <strong>Ten sach</strong>
                            <p>${record.bookTitle}</p>
                        </div>

                        <div class="book-meta-item">
                            <strong>Ngay muon</strong>
                            <p>${record.borrowDate}</p>
                        </div>

                        <div class="book-meta-item">
                            <strong>Han tra</strong>
                            <p>${record.dueDate}</p>
                        </div>

                        <div class="book-meta-item">
                            <strong>Trang thai</strong>
                            <p>
                                <span class="badge">
                                    ${record.status}
                                </span>
                            </p>
                        </div>

                    </div>
                </c:when>
                <c:otherwise>
                    <p class="lead">Chua co phieu muon nao.</p>
                </c:otherwise>
            </c:choose>

        </section>

    </body>
</html>
