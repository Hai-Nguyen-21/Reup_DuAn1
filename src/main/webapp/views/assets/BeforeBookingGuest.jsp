<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./views/assets/css/afterbookingguest.css">
    <link rel="stylesheet" href="./views/assets/css/grid.css">
    <link rel="stylesheet" href="./views/assets/css/base.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
        integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="./views/assets/fontawesome-free-5.15.3-web/css/all.min.css">

</head>

<body>
    <div id="app">

        <header>
            <h1>Info booking Guest</h1>
        </header>

        <div id="form">

            <div class="fish" id="fish"></div>
            <div class="fish" id="fish2"></div>

            <form id="waterform" method="post">

                <div class="formgroup" id="name-form">
                    <label for="name">Họ và tên</label>
                    <input required type="text" id="name" name="name" value="Nguyễn Lê Hải"/>
                </div>

                <div class="formgroup" id="email-form">
                    <label for="email">Ngày đặt</label>
                    <input required type="text" id="email" name="date" value="30/01/2021"/>
                </div>

                <div class="formgroup" id="name-form">
                    <label for="name">Giờ đặt</label>
                    <input required type="text" id="name" name="time" value="14:00 PM"/>
                </div>

                <div class="formgroup" id="message-form">
                    <label for="message">Ghi chú</label>
                    <textarea  required style="resize: none;" id="message" name="message"></textarea>
                </div>

                <input type="submit" class="cancel" style="width: 500px !important;" value="ĐĂT BÀN NGAY"/>
            </form>
        </div>

    </div>

    <div class="container_support">
        <i class="fas fa-phone-square-alt"></i>
        <p class="container_support_text">Số điện thoại liên hệ: <span>0967381938</span> </p>
    </div>

    <div class="container_footer">
        <hr>
        <p>Copyright © 2021 Team One. Powered by HaiNguyen</p>
    </div>

    <script src="./views/assets/js/afterbookingguest.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>