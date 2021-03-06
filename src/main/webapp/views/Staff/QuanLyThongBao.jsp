<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./views/Staff/css/base.css">
    <link rel="stylesheet" href="./views/Staff/css/quanlythongbao.css">
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
                        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                            <li class="nav-item1" role="presentation">
                                <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home"
                                    aria-selected="true">
                                    X??c nh???n
                                </button>
                            </li>
                            <li class="nav-item1" role="presentation">
                                <button class="nav-link" id="pills-home-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-not" type="button" role="tab" aria-controls="pills-not"
                                    aria-selected="true">
                                    B??n ???? x??c nh???n
                                </button>
                            </li>
                            <li class="nav-item1" role="presentation">
                                <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-profile" type="button" role="tab"
                                    aria-controls="pills-profile" aria-selected="false">
                                    B??n h???y
                                </button>
                            </li>
                        </ul>
						<form action="/QL_Dat_Ban_NH/Notification" method="post">
                        <div class="tab-content" id="pills-tabContent">
                            <!--confirm b??n start-->
                            <div class="tab-pane fade show active" id="pills-home" role="tabpanel"
                                aria-labelledby="pills-home-tab">
                                <div class="header_search">
                                    <form action="" method="post">
                                        <input type="search" name="" id="" placeholder="Nh???p m?? b??n...">
                                        <button type="button" class="btn btn-dark">
                                            <svg xmlns="http://www.w3.org/2000/svg" style="color: white;" width="16" height="16" fill="currentColor"
                                                class="bi bi-search" viewBox="0 0 16 16">
                                                <path
                                                    d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                            </svg>
                                            T??M KI???M
                                        </button>
                                    </form>
                                </div>
                                <div class="body_right--header" style="float: left;">
                                    <button type="button" class="btn btn-success js-modal-btn">Th??m b??n</button>
                                </div>
                                <div class="body_right--table">
                                    <table class="table" style="text-align: center;">
                                        <thead>
                                            <tr>
                                                <th scope="col">M?? B??n ?????t</th>
                                                <th scope="col">NG??Y ?????T</th>
                                                <th scope="col">GI??? ?????T</th>
                                                <th scope="col">XEM CHI TI???T</th>
                                                <th scope="col">T??C V???</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${danh_sach_doi }" var="waitting">
                                            <tr>
                                                <th scope="row">${waitting.idBd}</th>
                                                <td>${waitting.ngayDatBan }</td>
                                                <td>${waitting.gioDatBan }</td>
                                                <td><a href="/QL_Dat_Ban_NH/Confirmbooking?index=${waitting.idBd }">chi ti???t</a></td>
                                                <td>
                                                    <button type="button" onclick="showMessage(${waitting.idBd})" class="btn btn-danger">X??a</button>
                                                </td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!--confirm b??n end-->

                            <!--b??n ???? confirm start-->
                            <div class="tab-pane fade" id="pills-not" role="tabpanel"
                                aria-labelledby="pills-profile-tab">
                                <div class="body_right--table">
                                    <table class="table" style="text-align: center;">
                                        <thead>
                                            <tr>
                                                <th scope="col">M?? B??n ?????t</th>
                                                <th scope="col">NG??Y ?????T</th>
                                                <th scope="col">GI??? ?????T</th>
                                                <th scope="col">M?? B??N</th>
                                                <th scope="col">T??C V???</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${da_xac_nhan }" var="cf">
                                            <tr>
                                                <th scope="row">${cf.idBd }</th>
                                                <td>${cf.ngayDatBan }</td>
                                                <td>${cf.gioDatBan }</td>
                                                <td>
                                                	<c:forEach items="${ban_dat_chi_tiet}" var="bdct">
                                                		<c:if test="${bdct.thongTinBanDat.idBd == cf.idBd }">
                                                			<div>${bdct.ttBan.IDBan }</div>
                                                		</c:if>
                                                	</c:forEach>
                                                </td>
                                                <td>
                                                    <button type="button" onclick="showMessagecancel(${cf.idBd})" class="btn btn-danger">X??a</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            
                            <!--b??n ???? confirm end-->

                            <!--b??n h???y start-->
                            <div class="tab-pane fade" id="pills-profile" role="tabpanel"
                                aria-labelledby="pills-profile-tab">
                                <div class="body_right--table">
                                    <table class="table" style="text-align: center;">
                                        <thead>
                                            <tr>
                                                <th scope="col">M?? KH??CH H??NG</th>
                                                <th scope="col">NG??Y ?????T</th>
                                                <th scope="col">GI??? ?????T</th>
                                                <th scope="col">M?? B??N</th>
                                                <th scope="col">TR???NG TH??I</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${da_huy}" var="canncel">
                                        
                                            <tr>
                                                <th scope="row">1</th>
                                                <td>${canncel.ngayDatBan }</td>
                                                <td>${canncel.gioDatBan }</td>
                                                
                                                <td>
                                                	<c:forEach items="${ban_dat_chi_tiet}" var="bdct">
                                                		<c:if test="${bdct.thongTinBanDat.idBd == canncel.idBd }">
                                                			<div>${bdct.ttBan.IDBan }</div> 
                                                		</c:if>
                                                	</c:forEach>	
                                                </td>
                                                
                                                <td>${canncel.trang_Thai }</td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!--b??n h???y end-->
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--TH??M B??N MODAL-->
        <form action="/QL_Ban_Dat_NH/Notification" method="post">
        <div class="modal_add js_modal_add">
            <div class="modal_add_container js_modal_add_container">
                <h3>TH??M B??N M???I</h3>
                <form>
                    <div class="mb-3">
                        <label for="exampleInputFullName1" class="form-label">T??N KH??CH H??NG</label>
                        <input required type="text" class="form-control" onchange=""
                            id="exampleInputFullName1" name="ten_kh" onkeyup="checkFormName()">
                        <label for="" class="error" id="nameHelp"></label>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputPhoneNume1" class="form-label">S??? ??I???N THO???I</label>
                        <input required type="text" class="form-control" id="exampleInputPhoneNume1"
                            aria-describedby="emailHelp" name="sdt" onkeyup="checkFormPhone()">
                        <label for="" class="error" id="phoneHelp"></label>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputQuantity" class="form-label">S??? L?????NG NG?????I</label>
                        <input required type="number" class="form-control" id="exampleInputQuantity"
                            aria-describedby="emailHelp" name="so_luong" onkeyup="checkNumber()">
                        <label for="" class="error" id="quantityHelp"></label>
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <textarea class="form-control" maxlength="100"
                                placeholder="T???i ??a nh???p 100 k?? t???..." name="note" id="floatingTextarea2"
                                style="height: 100px; resize: none;"></textarea>
                            <label for="floatingTextarea2">CHI TI???T</label>
                        </div>
                        <label for="" class="error txtAreaHelp"></label>
                    </div>
                    <button type="submit" formaction="/QL_Dat_Ban_NH/Notification/Create" id="submit" class="btn btn-primary">Submit</button>
                    <button type="button" class="btn btn-danger js_btn-close">Exit</button>
                </form>
            </div>
        </div>
        </form>
    </div>
	

    <script src="./views/Staff/js/sidebar.js"></script>
    <script src="./views/Staff/js/thongtincanhanstaff.js"></script>
    <script src="./views/Staff/js/modaladdpost.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        <script>
			function showMessage(id){
            	var option = confirm('B???n c?? mu???n x??a ?????t b??n n??y kh??ng?');
            	if(option){
                	window.location.href = '/QL_Dat_Ban_NH/CancelBooking/Staffdelete?id='+id;
            	}
        	}
        	function showMessagecancel(id){
            	var option = confirm('B???n c?? mu???n x??a ?????t b??n n??y kh??ng?');
            	if(option){
                	window.location.href = '/QL_Dat_Ban_NH/CancelBooking/Staffcancel?id='+id;
            	}
        	}
	</script>
</body>

</html>