<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sách theo thể loại</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>

<section class="card">

    <div>
        <h1>Sách theo thể loại</h1>

        <p class="lead">
            Khám phá kho sách được phân loại theo từng chủ đề giúp tìm kiếm nhanh chóng và thuận tiện hơn.
        </p>
    </div>

</section>

<section class="library-book-grid">

    <c:forEach var="category" items="${categories}">

        <article class="card">

            <h2>${category.name}</h2>

            <p class="lead">
                ${category.description}
            </p>

            <div class="command-actions">

                <a class="btn btn-secondary"
                   href="${pageContext.request.contextPath}/books?categoryId=${category.id}">
                    Xem sách
                </a>

            </div>

        </article>

    </c:forEach>

</section>

</body>
</html>

