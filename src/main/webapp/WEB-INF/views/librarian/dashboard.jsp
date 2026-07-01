<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<!DOCTYPE html>

<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Bang dieu khien thu thu</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style-librarian.css">

    </head>
    <body>

        <section class="card">

            <div>
                <h1>Bang dieu khien thu thu</h1>

                <p class="lead">
                    Theo doi tinh trang muon tra sach, xu ly yeu cau cua doc gia va quan ly phi phat.
                </p>
            </div>

            <div class="command-actions">

                <a class="btn btn-success"
                   href="${pageContext.request.contextPath}/librarian/borrowings">
                    Quan ly muon tra
                </a>

                <a class="btn btn-secondary"
                   href="${pageContext.request.contextPath}/librarian/books">
                    Quan ly sach
                </a>

            </div>

        </section>

        <section class="grid stats">

            <article class="card stat">
                <span>Yeu cau cho duyet</span>
                <b>${pendingRequestCount}</b>
            </article>

            <article class="card stat">
                <span>Sach dang duoc muon</span>
                <b>${borrowingCount}</b>
            </article>

            <article class="card stat">
                <span>Sach qua han</span>
                <b>${overdueCount}</b>
            </article>

            <article class="card stat">
                <span>Phieu phat</span>
                <b>${fineCount}</b>
            </article>

        </section>

        <section class="grid"
                 style="grid-template-columns: 1.4fr .9fr; margin-top: 18px;">

            <article class="card">

                <div class="panel-header">
                    <div>
                        <h2>Cong viec can xu ly</h2>
                        <p class="lead">
                            Cac tac vu thuong xuyen cua thu thu.
                        </p>
                    </div>
                    <span class="badge">Hom nay</span>
                </div>

                <table class="table">
                    <thead>
                        <tr>
                            <th>Cong viec</th>
                            <th>Muc do uu tien</th>
                            <th>Thao tac</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Duyet yeu cau muon sach</td>
                            <td><span class="badge">Cao</span></td>
                            <td>
                                <a class="btn btn-secondary"
                                   href="${pageContext.request.contextPath}/librarian/borrowings">
                                    Mo
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>Xu ly sach qua han</td>
                            <td><span class="badge">Cao</span></td>
                            <td>
                                <a class="btn btn-secondary"
                                   href="${pageContext.request.contextPath}/librarian/fines">
                                    Mo
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>Cap nhat tinh trang sach</td>
                            <td><span class="badge">Trung binh</span></td>
                            <td>
                                <a class="btn btn-secondary"
                                   href="${pageContext.request.contextPath}/librarian/books">
                                    Mo
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </article>

            <article class="card">

                <h2>Thong tin nghiep vu</h2>

                <p class="lead">
                    Tinh trang hoat dong cua thu vien.
                </p>

                <div style="display:grid;gap:12px;margin-top:18px;">
                    <span class="badge">Doc gia dang hoat dong: ${readerCount}</span>
                    <span class="badge">Phieu muon hom nay: ${todayBorrowCount}</span>
                    <span class="badge">Sach can kiem ke: ${lowStockBookCount}</span>
                </div>

            </article>

        </section>

    </body>
</html>
