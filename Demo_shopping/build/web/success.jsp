<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* Định dạng chung */
            body {
                background-color: #f5f5f5;
                font-family: Arial, sans-serif;
                text-align: center;
            }

            h1 {
                color: #333;
                font-size: 36px;
                margin-top: 100px;
                animation: fadeInDown 1s ease-in-out;
            }

            h3 {
                color: #777;
                font-size: 24px;
                margin-top: 20px;
                animation: fadeInUp 1s ease-in-out;
            }

            .image-container {
                position: relative;
                display: inline-block;
                width: 100%;
                height: auto;
            }

            .image-container img {
                display: block;
                width: 100%;
            }

            .image-container .image-text {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                color: white;
                font-size: 24px;
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8);
            }
            .image-container .line1 {
                color: red;
                top: 30%; /* Thay đổi giá trị top để điều chỉnh vị trí dòng chữ 1 */
            }

            .image-container .line2 {
                color: #28a745;
                top: 40%; /* Thay đổi giá trị top để điều chỉnh vị trí dòng chữ 2 */
            }
        </style>
    </head>
    <body>

        <div class="image-container">
            <img src="https://thuthuatnhanh.com/wp-content/uploads/2020/03/hinh-anh-dep-phong-canh.jpg" alt="Your Image">
            <div class="image-text line1">Bạn đã mua hàng thành công!</div>
            <div class="image-text line2">Cảm ơn bạn đã tin tưởng!</div>
        </div>
    </body>
</html>
