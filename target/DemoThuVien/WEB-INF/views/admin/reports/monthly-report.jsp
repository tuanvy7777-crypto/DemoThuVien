<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Bao cao thu vien</title>
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">
            <div>
                <h1>Bao cao thu vien</h1>
                <p class="lead">Thong ke hoat dong thu vien, tinh hinh muon tra sach va cac du lieu quan trong.</p>
            </div>

            <div class="command-actions">
                <a class="btn btn-secondary"
                   href="${pageContext.request.contextPath}/admin/reports/export/pdf">
                    Xuat PDF
                </a>

                <a class="btn btn-primary"
                   href="${pageContext.request.contextPath}/admin/reports/export/excel">
                    Xuat Excel
                </a>
            </div>
        </section>

        <section class="card">
            <h2>Tong quan he thong</h2>
            <div class="grid stats">
                <c:forEach var="item" items="${overview}">
                    <div class="card stat">
                        <span>${item.key}</span>
                        <b>${item.value}</b>
                    </div>
                </c:forEach>
            </div>
        </section>

        <section class="card">
            <h2>Thong ke luot muon theo thang</h2>
            <c:forEach var="stat" items="${monthlyStats}">
                <p>${stat.key}: <strong>${stat.value}</strong> luot muon</p>
            </c:forEach>
        </section>

        <section class="card">
            <h2>Sach duoc muon nhieu nhat</h2>
            <c:forEach var="book" items="${mostBorrowedBooks}">
                <p><strong>${book.title}</strong> (${book.category})</p>
            </c:forEach>
        </section>

        <section class="card">
            <h2>Danh sach sach qua han</h2>
            <c:forEach var="record" items="${overdueRecords}">
                <p>#${record.id} - ${record.readerName} - ${record.bookTitle} - Han tra: ${record.dueDate}</p>
            </c:forEach>
        </section>

    </body>
</html>
