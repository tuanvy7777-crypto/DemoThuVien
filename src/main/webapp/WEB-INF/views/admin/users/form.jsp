<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

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
                    Tạo và phân quyền tài khoản trong hệ thống thư viện.
                </p>
            </div>

            <div class="command-actions">
                <a class="btn btn-secondary"
                   href="${pageContext.request.contextPath}/admin/users">
                    Quay lại
                </a>
            </div>

        </section>

        <section class="card">

            <form class="form"
                  method="post"
                  action="${pageContext.request.contextPath}/admin/users/save">

                <input type="hidden"
                       name="id"
                       value="${user.id}">

                <div class="form-grid">

                    <div class="form-row">
                        <label>Họ và tên</label>

                        <input type="text"
                               name="fullName"
                               value="${user.fullName}"
                               required>
                    </div>

                    <div class="form-row">
                        <label>Tài khoản</label>

                        <input type="text"
                               name="username"
                               value="${user.username}"
                               required>
                    </div>

                    <div class="form-row">
                        <label>Mật khẩu</label>

                        <input type="password"
                               name="password"
                               placeholder="Để trống sẽ dùng mật khẩu 123456 khi tạo mới">
                    </div>

                    <div class="form-row">
                        <label>Email</label>

                        <input type="email"
                               name="email"
                               value="${user.email}">
                    </div>

                    <div class="form-row">
                        <label>Điện thoại</label>

                        <input type="text"
                               name="phone"
                               value="${user.phone}">
                    </div>

                    <div class="form-row">
                        <label>Địa chỉ</label>

                        <input type="text"
                               name="address"
                               value="${user.address}">
                    </div>

                    <div class="form-row">
                        <label>Vai trò</label>

                        <select name="role">
                            <option value="ADMIN"
                                    ${user.role == 'ADMIN' ? 'selected' : ''}>
                                Quản trị viên
                            </option>

                            <option value="LIBRARIAN"
                                    ${user.role == 'LIBRARIAN' ? 'selected' : ''}>
                                Thủ thư
                            </option>

                            <option value="READER"
                                    ${user.role == 'READER' ? 'selected' : ''}>
                                Độc giả
                            </option>
                        </select>
                    </div>

                    <div class="form-row">
                        <label>Trạng thái</label>

                        <select name="status">
                            <option value="ACTIVE"
                                    ${user.status == 'ACTIVE' ? 'selected' : ''}>
                                Hoạt động
                            </option>

                            <option value="LOCKED"
                                    ${user.status == 'LOCKED' ? 'selected' : ''}>
                                Khóa
                            </option>
                        </select>
                    </div>

                </div>

                <div class="command-actions">

                    <button class="btn btn-success"
                            type="submit">
                        Lưu người dùng
                    </button>

                    <a class="btn btn-secondary"
                       href="${pageContext.request.contextPath}/admin/users">
                        Hủy
                    </a>

                </div>

            </form>

        </section>

    </body>
</html>

