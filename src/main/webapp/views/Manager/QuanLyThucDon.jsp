<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./views/Manager/css/base.css">
    <link rel="stylesheet" href="./views/Manager/css/quanlythucdon.css">
    <link rel="stylesheet" href="./views/Manager/css/grid.css">
    <link rel="stylesheet" href="./views/Manager/css/addPost.css">
    <link rel="stylesheet" href="./views/assets/fontawesome-free-5.15.3-web/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
    <div id="app">
        <div class="container-fluid">
            
            <jsp:include page="SideBarManager.jsp"></jsp:include>

            <div class="container_right l-12">
                <div class="right_header" style="color: white; font-size: 18px;">
                    <h4 style=" margin-top: 10px;">QUẢN LÝ THỰC ĐƠN</h4>
                </div>

            </div>
            <div class="container_right_body">
                <div class="body_left l-3"></div>
                <div class="right_body l-9">
                    <div class="right_body--header">
                        <div class="header_button">
                            <button type="button" class="btn btn-success js-modal-btn">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                                    class="bi bi-plus-lg" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd"
                                        d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z" />
                                </svg>
                                THÊM MỚI
                            </button>
                        </div>
                        <div class="header_search">
                            <form action="" method="post">
                                <input type="search" name="" id="" placeholder="Nhập tên nhân viên">
                                <button type="button" class="btn btn-dark">
                                    <svg xmlns="http://www.w3.org/2000/svg" style="color: white;" width="16" height="16"
                                        fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                        <path
                                            d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                    </svg>
                                    TÌM KIẾM
                                </button>
                            </form>
                        </div>
                    </div>
                    <div class="right_body--content">
                        <div class="content_item">
                            <div class="item--img">
                                <img src="./views/Manager/imgs/cahoinauyfillet.png"style="width: 298px; height: 240px;" alt="">
                            </div>
                            <div class="item--title">
                                <h5>--Cá hồi Nauy Fillet--</h5>
                            </div>
                            <div class="item--priceIn">
                                <h6><span>Giá nhập: </span> 90.000 VNĐ</h6>
                            </div>
                            <div class="item--priceOut">
                                <h6 style="color: tomato;"><span>Giá bán: </span> 100.000 VNĐ</h6>
                            </div>
                            <div class="item_button">
                                <button type="button" class="btn btn-success">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
                                        <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>
                                    </svg>
                                </button>
                                <button type="button" class="btn btn-danger">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                        <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                    </svg>
                                </button>
                            </div>
                        </div>
                        <div class="content_item">
                            <div class="item--img">
                                <img src="./views/Manager/imgs/cahoinauyfillet.png"style="width: 298px; height: 240px;" alt="">
                            </div>
                            <div class="item--title">
                                <h5>--Cá hồi Nauy Fillet--</h5>
                            </div>
                            <div class="item--priceIn">
                                <h6><span>Giá nhập: </span> 90.000 VNĐ</h6>
                            </div>
                            <div class="item--priceOut">
                                <h6 style="color: tomato;"><span>Giá bán: </span> 100.000 VNĐ</h6>
                            </div>
                            <div class="item_button">
                                <button type="button" class="btn btn-success">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
                                        <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>
                                    </svg>
                                </button>
                                <button type="button" class="btn btn-danger">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                        <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                    </svg>
                                </button>
                            </div>
                        </div>
                        <div class="content_item">
                            <div class="item--img">
                                <img src="./views/Manager/imgs/cahoinauyfillet.png"style="width: 298px; height: 240px;" alt="">
                            </div>
                            <div class="item--title">
                                <h5>--Cá hồi Nauy Fillet--</h5>
                            </div>
                            <div class="item--priceIn">
                                <h6><span>Giá nhập: </span> 90.000 VNĐ</h6>
                            </div>
                            <div class="item--priceOut">
                                <h6 style="color: tomato;"><span>Giá bán: </span> 100.000 VNĐ</h6>
                            </div>
                            <div class="item_button">
                                <button type="button" class="btn btn-success">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
                                        <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>
                                    </svg>
                                </button>
                                <button type="button" class="btn btn-danger">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                        <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                    </svg>
                                </button>
                            </div>
                        </div>
                        <div class="content_item">
                            <div class="item--img">
                                <img src="./views/Manager/imgs/cahoinauyfillet.png"style="width: 298px; height: 240px;" alt="">
                            </div>
                            <div class="item--title">
                                <h5>--Cá hồi Nauy Fillet--</h5>
                            </div>
                            <div class="item--priceIn">
                                <h6><span>Giá nhập: </span> 90.000 VNĐ</h6>
                            </div>
                            <div class="item--priceOut">
                                <h6 style="color: tomato;"><span>Giá bán: </span> 100.000 VNĐ</h6>
                            </div>
                            <div class="item_button">
                                <button type="button" class="btn btn-success">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
                                        <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>
                                    </svg>
                                </button>
                                <button type="button" class="btn btn-danger">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                        <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>

        <div class="modal_add js_modal_add">
            <div class="modal_add_container js_modal_add_container">
                <h3>THÊM MÓN ĂN MỚI</h3>
                <form>
                    <div class="mb-3">
                        <label for="exampleInputImg" class="form-label">Chọn ảnh món ăn</label>
                        <input required type="file" class="form-control" onchange="return fileValid()" id="exampleInputImg">
                        <label for="" class="error"></label>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputTitle" class="form-label">Tên món ăn</label>
                        <input required type="text" class="form-control" id="exampleInputTitle" aria-describedby="emailHelp">
                        <label for="" class="error"></label>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputTitle" class="form-label">Giá</label>
                        <input required type="number" class="form-control" id="exampleInputPrice" aria-describedby="emailHelp">
                        <label for="" class="error"></label>
                    </div>
                    <select class="form-select" style="margin-bottom: 30px;" aria-label="Default select example">
                        <option selected>Chọn loại thực đơn</option>
                        <option value="meat">Thịt</option>
                        <option value="fish">Cá</option>
                        <option value="vegetable">Rau</option>
                    </select>
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="button" class="btn btn-danger js_btn-close">Exit</button>
                </form>
            </div>
        </div>
    </div>

    <div class="container_footer" style="text-align: center;">
        <hr>
        <p>Copyright © 2021 Team One. Powered by HaiNguyen</p>
    </div>
    <script src="./views/Manager/js/modaladdnhanvien.js"></script>
    <script src="./views/Manager/js/sidebar.js"></script>
    <script>
        function showMess(){
            var option = confirm("Bạn có chắc muốn xóa bài viết này không?");
            if(option === true){
                alert("Đã xóa");
            } else{
                alert("Không xóa");
            }
        }

        function fileValid(){
            var fileInput = document.getElementById('exampleInputImg');
            var filePath = fileInput.value;
            var allowedExtendsion = /(\.png|\.jpeg|\.jpg)$/i;

            if(!allowedExtendsion.exec(filePath)){
                alert("Vui lòng nhập định dạng ảnh .png, .jpge, .jpg");
                document.getElementById('exampleInputImg').style.borderColor = "red";
                fileInput.value = '';
                return false;
            } else {
                document.getElementById('exampleInputImg').style.borderColor = "green";
            }
        }
    </script>
</body>

</html>