<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<section class="card">
    <h1>Quan ly tien phat</h1>
    <p class="lead">Theo doi va xu ly cac khoan phat do tra sach qua han.</p>
</section>

<section class="grid stats">
    <article class="card stat">
        <span>Tong tien phat</span>
        <b>${totalFineAmount} VND</b>
    </article>

    <article class="card stat">
        <span>Chua thanh toan</span>
        <b>${unpaidFineAmount} VND</b>
    </article>
</section>

<section class="card">
    <table class="table">
        <thead>
            <tr>
                <th>Ma</th>
                <th>Doc gia</th>
                <th>So tien</th>
                <th>Ly do</th>
                <th>Trang thai</th>
                <th>Thao tac</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="fine" items="${fines}">
                <tr>
                    <td>#${fine.id}</td>
                    <td>${fine.readerName}</td>
                    <td>${fine.amount} VND</td>
                    <td>${fine.reason}</td>
                    <td>
                        <span class="badge">
                            ${fine.paid ? 'Da thanh toan' : 'Chua thanh toan'}
                        </span>
                    </td>
                    <td>
                        <form method="post"
                              action="${pageContext.request.contextPath}/librarian/fines/status">
                            <input type="hidden" name="fineId" value="${fine.id}">
                            <input type="hidden" name="paid" value="${!fine.paid}">
                            <button class="btn btn-secondary" type="submit">
                                ${fine.paid ? 'Chuyen chua thanh toan' : 'Ghi nhan da thanh toan'}
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>

            <c:if test="${empty fines}">
                <tr>
                    <td colspan="6">Chua co phieu phat nao.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</section>
