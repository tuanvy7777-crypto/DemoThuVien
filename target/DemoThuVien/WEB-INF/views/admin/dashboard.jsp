<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Bảng điều khiển quản trị</title>

        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/assets/css/style.css">
    </head>
    <body>

        <section class="card">

            <div>
                <h1>Bảng điều khiển quản trị</h1>

                <p class="lead">
                    Theo dõi nhanh hoạt động thư viện, số lượng sách và các công việc cần xử lý.
                </p>
            </div>

            <div class="command-actions">

                <a class="btn btn-success"
                   href="${pageContext.request.contextPath}/admin/books/create">
                    Thêm sách
                </a>

                <a class="btn btn-secondary"
                   href="${pageContext.request.contextPath}/admin/reports/monthly">
                    Xem báo cáo
                </a>

            </div>

        </section>

        <section class="grid stats">

            <c:forEach var="item" items="${overview}">

                <article class="card stat">

                    <span>${item.key}</span>

                    <b>${item.value}</b>

                </article>

            </c:forEach>

        </section>

        <section class="grid"
                 style="grid-template-columns: 1.4fr .9fr; margin-top: 18px;">

            <article class="card">

                <div class="panel-header">

                    <div>
                        <h2>Công việc cần xử lý</h2>

                        <p class="lead">
                            Các tác vụ thường xuyên của thủ thư và quản trị viên.
                        </p>
                    </div>

                    <span class="badge">
                        Hôm nay
                    </span>

                </div>

                <table class="table">

                    <thead>
                        <tr>
                            <th>Công việc</th>
                            <th>Mức độ ưu tiên</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>

                    <tbody>

                        <tr>
                            <td>Duyệt yêu cầu mượn sách</td>

                            <td>
                                <span class="badge">
                                    Cao
                                </span>
                            </td>

                            <td>
                                <a class="btn btn-secondary"
                                   href="${pageContext.request.contextPath}/admin/borrowings">
                                    Mở
                                </a>
                            </td>
                        </tr>

                        <tr>
                            <td>Cập nhật đầu sách và tồn kho</td>

                            <td>
                                <span class="badge">
                                    Trung bình
                                </span>
                            </td>

                            <td>
                                <a class="btn btn-secondary"
                                   href="${pageContext.request.contextPath}/admin/books">
                                    Mở
                                </a>
                            </td>
                        </tr>

                        <tr>
                            <td>Kiểm tra sách quá hạn</td>

                            <td>
                                <span class="badge">
                                    Cao
                                </span>
                            </td>

                            <td>
                                <a class="btn btn-secondary"
                                   href="${pageContext.request.contextPath}/admin/reports/overdue">
                                    Mở
                                </a>
                            </td>
                        </tr>

                    </tbody>

                </table>

            </article>

            <article class="card">

                <h2>Trạng thái hệ thống</h2>

                <p class="lead">
                    Thông tin môi trường đang vận hành hệ thống thư viện.
                </p>

                <div style="display:grid;gap:12px;margin-top:18px;">

                    <span class="badge">
                        Cơ sở dữ liệu: LibraryManagementDB
                    </span>

                    <span class="badge">
                        Ứng dụng: DemoThuVien
                    </span>

                    <span class="badge">
                        Công nghệ: Spring MVC + JSP
                    </span>

                </div>

            </article>

        </section>

    </body>
</html>

