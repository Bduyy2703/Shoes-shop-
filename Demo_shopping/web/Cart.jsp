<%-- 
    Document   : Cart
    Created on : Oct 31, 2020, 9:42:21 PM
    Author     : trinh
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entity.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .quantity_input {
                width: 40px;
                text-align: center;
            }
        </style>
    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="shopping-cart">
                <div class="px-4 px-lg-0">

                    <div class="pb-5">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

                                    <!-- Shopping cart table -->
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="p-2 px-3 text-uppercase">No</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="p-2 px-3 text-uppercase">Sản Phẩm</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Đơn Giá</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Số Lượng</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Xóa</div>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${list}" var="o" varStatus="loop">
                                                <tr>
                                                    <td>${loop.index + 1}</td>
                                                    <td scope="row">
                                                        <div class="p-2">
                                                            <img src="${o.image}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                            <div class="ml-3 d-inline-block align-middle">
                                                                <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block">${o.name}</a></h5>
                                                                <span class="text-muted font-weight-normal font-italic"></span>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="align-middle"><strong>${o.price}</strong></td>
<!--                                                    <td class="align-middle">
                                                        <button class="btnSub" onclick="decreaseQuantity(${o.id})">-</button>
                                                        <strong id="quantity${o.id}">${o.quantity}</strong>
                                                        <a href="ViewCart?id=${o.id}&action=AddCart" >
                                                            <button class="btnAdd" onclick="increaseQuantity(${o.id})">+</button>
                                                        </a>
                                                    </td>-->
                                                    <td class="align-middle">
                                                        <a href="MainController?id=${o.id}&action=DecreaseCart">
                                                        <button class="btnSub" onclick="decreaseQuantity(${o.id}, ${o.price})">-</button>
                                                        
                                                        </a>
                                                            <strong id="quantity${o.id}">${o.quantity}</strong>
<!--                                                        <div class="row">
                                                            <div class="col">-->
                                                                <a href="MainController?id=${o.id}&action=IncreaseCart">
                                                                    <button class="btnAdd" onclick="increaseQuantity(${o.id})">+</button>
                                                                </a>

<!--                                                            </div>
                                                        </div>-->
                                                    </td>
                                                    <td class="align-middle">
<!--                                                        <form action="ViewCart" method="post">
                                                            <input type="hidden" name="productId" value="${o.id}">
                                                            <button type="submit" class="btn btn-danger">Remove</button>
                                                        </form>-->
                                                        <!--<a href="ViewCart?id=${o.id}&amp;quantity=0">Remove Item</a>-->
<!--                                                        <a href="MainController?id=${o.id}&action=Remove" class="text-dark">
                                                            <button class="btn btn-danger">Remove</button>
                                                        </a>-->
                                                        <form action="ViewCart" method="post">
                                                            <input type="hidden" name="productId" value="${o.id}">
                                                            <button type="submit" class="btn btn-danger">Remove</button>
                                                        </form>
                                                     </tr>
                                            </c:forEach>
                                            
                                        </tbody>
                                    </table>
                                </div>
                                <!-- End -->
                            </div>
                        </div>

                        <div class="row py-5 p-4 bg-white rounded shadow-sm">
                            <div class="col-lg-6">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Voucher</div>
                                <div class="p-4">
                                    <div class="input-group mb-4 border rounded-pill p-2">
                                        <input type="text" placeholder="Nhập Voucher" aria-describedby="button-addon3" class="form-control border-0">
                                        <div class="input-group-append border-0">
                                            <button id="button-addon3" type="button" class="btn btn-dark px-4 rounded-pill"><i class="fa fa-gift mr-2"></i>Sử dụng</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thành tiền</div>
                                <div class="p-4">
                                    <ul class="list-unstyled mb-4">
                                        <li class="d-flex justify-content-between py-3 border-bottom">
                                            <strong class="text-muted">Tổng tiền hàng</strong>
                                            <strong id="totalPrice">${total} $</strong>
                                        </li>
                                        <li class="d-flex justify-content-between py-3 border-bottom">
                                            <strong class="text-muted">Phí vận chuyển</strong>
                                            <strong>Free ship</strong>
                                        </li>
                                        <li class="d-flex justify-content-between py-3 border-bottom">
                                            <strong class="text-muted">VAT</strong>
                                            <strong>${vat} $</strong>
                                        </li>
                                        <li class="d-flex justify-content-between py-3 border-bottom">
                                            <strong class="text-muted">Tổng thanh toán</strong>
                                            <h5 class="font-weight-bold">${sum} $</h5>
                                        </li>
                                    </ul><a href="#checkOutModal" class="btn btn-dark rounded-pill py-2 btn-block" data-toggle="modal">Mua hàng</a>
                                </div>
                            </div>
                        </div>
                        <div id="checkOutModal" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <form action="MainController" method="post">

                                        <div class="modal-header">						
                                            <h4 class="modal-title">Checkout</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        </div>
                                        <div class="modal-body">	
                                            <div class="form-group">
                                                <label>Full Name</label>
                                                <input type="text" class="form-control" name="fullName" required>
                                            </div>

                                            <div class="form-group">
                                                <label>Phone</label>
                                                <input type="text" class="form-control" name="phone" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Address</label>
                                                <input type="text" class="form-control" name="address" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Email</label>
                                                <input class="form-control" name="email" required>
                                            </div>					
                                            <div class="form-group">
                                                <label>Payment method</label>
                                                <input class="form-control" value="Payment on receipt" readonly="">
                                            </div>					
                                        </div>
                                        <div class="modal-footer">
                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                            
                                            <button type="submit" name="action" class="btn btn-success" value="Checkout" data-dismiss="false" > checkout</button>
                                            
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div id="errorModal" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Message</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p id="error-message"></p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="okButton">OK</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script>
          function decreaseQuantity(productId) {
    var quantityElement = document.getElementById("quantity" + productId);
    var quantity = parseInt(quantityElement.textContent);

    if (quantity > 0) {
        quantity--;
        quantityElement.textContent = quantity;
    } else {
        console.log("Số lượng đã là 0");
    }
}

function increaseQuantity(productId) {
    var quantityElement = document.getElementById("quantity" + productId);
    var quantity = parseInt(quantityElement.textContent);

    quantity++;
    quantityElement.textContent = quantity;
}


    </script>

    <% String errorMessage = (String) request.getAttribute("errorMessage");
                                                   if (errorMessage != null && !errorMessage.isEmpty()) {%>
    <script>

        $(document).ready(function () {
            var errorMessage = "<%= errorMessage%>";
            if (errorMessage) {
                $('#error-message').text(errorMessage);
                $('#errorModal').modal('show');
            }
        });

        $('#errorModal').on('hidden.bs.modal', function () {
            window.location.href = 'Cart.jsp';
        });
        $('#okButton').click(function () {
            $('#errorModal').modal('hide');
            window.location.href = 'Cart.jsp';
        });
        <% }%>
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

    
</html>