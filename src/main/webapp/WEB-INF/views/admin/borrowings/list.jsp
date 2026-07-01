<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Quan ly phieu muon</title>
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">
            <div>
                <h1>Quan ly phieu muon</h1>
                <p class="lead">Duyet yeu cau muon, xac nhan tra sach va theo doi cac phieu qua han.</p>
            </div>
        </section>

        <section class="card">
            <h2>Yeu cau muon sach</h2>

            <table class="table">
                <thead>
                    <tr>
                        <th>Ma</th>
                        <th>Doc gia</th>
                        <th>Sach</th>
                        <th>Ngay yeu cau</th>
                        <th>Trang thai</th>
                        <th>Thao tac</th>
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
                            <td>
                                <c:if test="${request.status == 'PENDING'}">
                                    <form method="post"
                                          action="${pageContext.request.contextPath}/admin/borrow-requests/status"
                                          style="display:inline;">
                                        <input type="hidden" name="requestId" value="${request.id}">
                                        <input type="hidden" name="status" value="APPROVED">
                                        <button class="btn btn-success" type="submit">Duyet</button>
                                    </form>
                                    <form method="post"
                                          action="${pageContext.request.contextPath}/admin/borrow-requests/status"
                                          style="display:inline;">
                                        <input type="hidden" name="requestId" value="${request.id}">
                                        <input type="hidden" name="status" value="REJECTED">
                                        <button class="btn btn-secondary" type="submit">Tu choi</button>
                                    </form>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty requests}">
                        <tr>
                            <td colspan="6">Chua co yeu cau muon sach.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </section>

        <section class="card">
            <h2>Phieu muon dang co</h2>

            <table class="table">
                <thead>
                    <tr>
                        <th>Ma</th>
                        <th>Doc gia</th>
                        <th>Ten sach</th>
                        <th>Ngay muon</th>
                        <th>Han tra</th>
                        <th>Trang thai</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="record" items="${records}">
                        <tr>
                            <td>#${record.id}</td>
                            <td>${record.readerName}</td>
                            <td>${record.bookTitle}</td>
                            <td>${record.borrowDate}</td>
                            <td>${record.dueDate}</td>
                            <td><span class="badge">${record.status}</span></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>

    </body>
</html>
