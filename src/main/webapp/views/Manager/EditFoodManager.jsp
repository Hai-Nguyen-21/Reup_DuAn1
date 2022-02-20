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
    <link rel="stylesheet" href="./views/Manager/css/editfoodmanager.css">
    <link rel="stylesheet" href="./views/Manager/css/addPost.css">
    <link rel="stylesheet" href="./views/Manager/css/grid.css">
    <link rel="stylesheet" href="./views/assets/fontawesome-free-5.15.3-web/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
    <div id="app">
        <div class="container-fluid">
        
            <jsp:include page="SideBarManager.jsp"></jsp:include>

            <div class="container_right l-12">
                <div class="right_header">
                </div>

                <div class="right_body">
                    <div class="body_container">
                        <h3>Chỉnh sửa thông tin món</h3>
                        <form>
                            <div class="mb-3">
                                <input type="image" src="" style="width: 230px; height: 200px;" class="form-control" id="exampleImg">
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputImg" class="form-label">Chọn ảnh</label>
                                <input required type="file" class="form-control" id="exampleInputImg" onchange="return fileValid()" accept="image/png, image/gif, image/jpeg"/>
                                <label for="" class="error"></label>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputTitle" class="form-label">Tên món ăn</label>
                                <input required type="text" class="form-control" id="exampleInputTitle" aria-describedby="emailHelp">
                                <label for="" class="error" style="color: red;"></label>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputTitle" class="form-label">Giá món</label>
                                <input required type="text" class="form-control" id="exampleInputTitle" aria-describedby="emailHelp">
                                <label for="" class="error" style="color: red;"></label>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputTitle" class="form-label">Loại đồ</label>
                                <select class="form-select" aria-label="Default select example">
                                    <option selected>Mời chọn loại đồ</option>
                                    <option value="1">Thịt</option>
                                    <option value="2">Cá</option>
                                    <option value="3">Tôm</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputTitle" class="form-label">Trạng thái</label>
                                <select class="form-select" aria-label="Default select example">
                                    <option selected>Mời chọn trạng thái</option>
                                    <option value="1">Còn hàng</option>
                                    <option value="2">Hết hàng</option>
                                    <option value="3">Tạm ngừng hoạt động</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="./views/Manager/js/sidebar.js"></script>
    <script>
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

        document.getElementById("exampleInputImg").onchange = function () {
            var reader = new FileReader();

            reader.onload = function (e) {
            // get loaded data and render thumbnail.
            document.getElementById("exampleImg").src = e.target.result;
            };

            // read the image file as a data URL.
            reader.readAsDataURL(this.files[0]);
        };
    </script>
</body>

</html>