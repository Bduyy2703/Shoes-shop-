<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .banner {
        position: relative;
        overflow: hidden;
        height: 500px; /* Set the desired height for the banner */
    }

    .banner-image {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        opacity: 0;
        transition: opacity 0.5s ease;
    }

    .banner-image.active {
        opacity: 1;
    }
    .logo{
        width: 80px;
        border-radius: 30%; 
    }
</style>
<!--begin of menu-->
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="HomeController"><img class="logo" src="https://png.pngtree.com/template/20191218/ourlarge/pngtree-sneaker-shoe-logos-can-be-used-for-store-logos-or-shoe-image_340677.jpg" alt="Sneaker"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <c:if test="${sessionScope.acc.isAdmin == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Manager Account</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc.isSell == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="ManagerController">Manager Product</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Hello ${sessionScope.acc.user}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutController">Logout</a>
                    </li> 
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="LoginController">Login</a>
                    </li>
                </c:if>
            </ul>

            <form action="MainController" method="post" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input oninput="searchByName(this)" value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number" name="action" value="Search">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                    <a class="btn btn-success btn-sm ml-3" href="ViewCart">
                        <i class="fa fa-shopping-cart"></i> Cart
                        <span class="badge badge-light" id="cartItemCount">0</span>
                    </a>

<!--                <button class="btn btn-success btn-sm ml-3" type="submit" name="action" value="View">
                    <i class="fa fa-shopping-cart"></i>Cart
                    <span class="badge badge-light">3</span>
                </button>-->
            </form>
        </div>
    </div>
</nav>

<div class="banner">
    <img class="banner-image active" src="https://img.freepik.com/premium-psd/sport-sneakers-shoes-sale-social-media-instagram-post-facebook-web-banner-template_70055-1317.jpg?w=1380" alt="Banner Image 1">
    <img class="banner-image" src="https://fastsole.co.uk/wp-content/uploads/2023/04/featured-image-6.jpg" alt="Image 2">
    <img class="banner-image" src="https://img.freepik.com/premium-vector/new-arrival-sneakers-collection-social-media-banner-template-design_596383-159.jpg?w=2000" alt="Image 3">
</div>
<script>
    const images = document.querySelectorAll('.banner-image');
    let currentImageIndex = 0;

    function showNextImage() {
        images[currentImageIndex].classList.remove('active');
        currentImageIndex = (currentImageIndex + 1) % images.length;
        images[currentImageIndex].classList.add('active');
    }

    setInterval(showNextImage, 3000);</script>


<script>
            // Lấy số lượng sản phẩm từ localStorage (nếu đã lưu)
            var cartItemCount = localStorage.getItem("cartItemCount");

            // Cập nhật thẻ <span> với số lượng sản phẩm
            document.getElementById("cartItemCount").textContent = cartItemCount || "0";
</script>
 <script>
     // Hàm để đếm số lượng mặt hàng dựa trên số dòng trong bảng
function updateCartItemCount() {
    var itemCountElement = document.getElementById('cartItemCount');

    // Kiểm tra xem phần tử có tồn tại không trước khi thay đổi giá trị
    if (itemCountElement) {
        var itemCount = document.querySelectorAll('table tbody tr').length;
        itemCountElement.textContent = itemCount;
        document.getElementById('cartItemCountInput').value = itemCount; // Lưu số lượng vào input hidden
    }
}

// Gọi hàm để cập nhật số lượng ban đầu
updateCartItemCount();

    </script>
    <script>

        // Đầu tiên, khởi tạo biến số lượng sản phẩm
        var itemCount = 0;

        // Sau đó, tìm và đếm số lượng sản phẩm dựa trên số cột "No"
        var rows = document.querySelectorAll("table tbody tr");
        itemCount = rows.length;

        // Cập nhật giá trị số lượng sản phẩm
        document.getElementById("cartItemCount").textContent = itemCount;
        
        // Lưu số lượng sản phẩm vào localStorage sau khi tính toán itemCount
        localStorage.setItem("cartItemCount", itemCount);
                window.addEventListener('beforeunload', function () {
    // Lưu số lượng sản phẩm vào localStorage trước khi người dùng rời khỏi trang
    localStorage.setItem("cartItemCount", itemCount);
});
    </script>
<!--end of menu-->
