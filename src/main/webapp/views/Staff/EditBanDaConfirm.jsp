<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./views/Staff/css/base.css">
    <link rel="stylesheet" href="./views/Staff/css/banxacnhanchitiet.css">
    <link rel="stylesheet" href="./views/Staff/css/grid.css">
    <link rel="stylesheet" href="./views/Staff/fontawesome-free-5.15.3-web/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
    <div id="app">
        <div class="container-fluid">
            
             <!-- side bar -->
			<jsp:include page="Sidebar.jsp"></jsp:include>

            <div class="container_right l-12">
                <div class="right_header">
                    <div class="header_search" style="float: left; margin-top: 10px;">
                        <button type="button" class="btn btn-secondary">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                            </svg>
                        </button>
                    </div>
                </div>

                <div class="container_right_body l-12">
                    <div class="body_left l-3"></div>
                    <div class="body_right l-9">
                        <form action="" method="post">
                            <div class="mb-3">
                                <label for="exampleFormControlIDK" class="form-label">Mã khách</label>
                                <input readonly type="text" class="form-control" id="exampleFormControlIDK" value="KH01">
                            </div>
                            <div class="tt_ban" style="width: 100%;">
                                <div class="content_button l-5" style="float: left; margin-right: 50px;">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="ban01" id="flexCheckDefault" checked>
                                        <label class="form-check-label" for="flexCheckDefault">
                                            <a href="">
                                                <button type="button" class="btn btn-warning buttonTable">
                                                    Bàn 01 <br>
                                                    Số người: 02
                                                </button>
                                            </a>
                                        </label>
                                    </div>
                                </div>
                                <div class="content_button l-5">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="ban01" id="flexCheckDefault" checked>
                                        <label class="form-check-label" for="flexCheckDefault">
                                            <a href="">
                                                <button type="button" class="btn btn-warning buttonTable">
                                                    Bàn 01 <br>
                                                    Số người: 02
                                                </button>
                                            </a>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="exampleFormControlDate" class="form-label">Thời gian đặt</label>
                                <input required type="datetime" class="form-control" id="exampleFormControlDate" value="2014-02-09">
                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlDate" class="form-label">Giờ đặt</label>
                                <input required type="text" class="form-control" id="exampleFormControlDate" value="14:00 PM">
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputQuantity" class="form-label">Số lượng người</label>
                                <input required type="text" class="form-control" id="exampleInputQuantity" onkeyup="checkNumber()" value="10">
                                <label for="" class="error" id="quantityHelp" style="color: tomato;"></label>
                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlTextarea1" class="form-label">Ghi chú</label>
                                <textarea required class="form-control" id="exampleFormControlTextarea1" rows="5"
                                    style="resize: none;">Nhà có 3 trẻ em</textarea>
                            </div>
                            <button type="button" class="btn btn-primary" id="submit" style="width: 300px;">Submit</button>
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>

    </div>

    <script src="./views/Staff/js/sidebar.js"></script>
    <script src="./views/Staff/js/thongtincanhanstaff.js"></script>
</body>

</html>