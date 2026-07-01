<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Dashboard doc gia</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <div>
                <h1>Dashboard doc gia</h1>

                <p class="lead">
                    Theo doi sach dang muon, lich su muon tra, thong bao va cac khoan phi phat sinh.
                </p>
            </div>

            <div class="command-actions">

                <a class="btn btn-primary"
                   href="${pageContext.request.contextPath}/books">
                    Tim sach
                </a>

                <a class="btn btn-secondary"
                   href="${pageContext.request.contextPath}/reader/borrowed-books">
                    Sach dang muon
                </a>

            </div>

        </section>

        <section class="grid stats">

            <article class="card stat">
                <span>Sach dang muon</span>
                <b>${borrowedCount}</b>
            </article>

            <article class="card stat">
                <span>Thong bao</span>
                <b>${notificationCount}</b>
            </article>

            <article class="card stat">
                <span>Phi phat hien tai</span>
                <b>${unpaidFineAmount} VND</b>
            </article>

            <article class="card stat">
                <span>Yeu cau cho duyet</span>
                <b>${pendingRequestCount}</b>
            </article>

        </section>

        <section class="card">

            <h2>Tong quan tai khoan</h2>

            <p class="lead">
                Cac so lieu tren duoc lay tu tai khoan dang dang nhap va du lieu trong SQL.
            </p>

        </section>

    </body>
</html>
