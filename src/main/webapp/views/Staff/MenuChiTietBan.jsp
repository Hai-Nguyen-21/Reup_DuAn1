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
<link rel="stylesheet" href="./views/Staff/css/menuchitietban.css">
<link rel="stylesheet" href="./views/Staff/css/grid.css">
<link rel="stylesheet"
	href="./views/Staff/fontawesome-free-5.15.3-web/css/all.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
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
						<div class="body_right_content">
							<table class="table" style="text-align: center;">
								<thead>
									<tr>
                                        <th scope="col">MÃ MÓN</th>
                                        <th scope="col">TÊN MÓN</th>
                                        <th scope="col">SỐ LƯỢNG</th>
                                        <th scope="col">ĐƠN GIÁ</th>
                                        <th scope="col">SỐ LƯỢNG ĐÃ LÊN</th>
                                        <th scope="col">THAO TÁC</th>
                                    </tr>
								</thead>
								<tbody>
									<tr>
                                        <td>1</td>
                                        <td>Lẩu thái</td>
                                        <td>
                                            <button class="btnPM" id="btnMinus1" onclick="onclickMinus1()">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-lg" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd" d="M2 8a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11A.5.5 0 0 1 2 8Z"/>
                                                </svg>
                                            </button>
                                            <input type="text" name="spinner" min="1" id="spinner1" class="spinner">
                                            <button class="btnPM" id="btnPlus1" onclick="onclickPlus1()">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
                                                </svg>
                                            </button>
                                        </td>
                                        <td>300.000</td>
                                        <td>
                                            <button class="btnPM" id="btnMinus2" onclick="onclickMinus2()">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-lg" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd" d="M2 8a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11A.5.5 0 0 1 2 8Z"/>
                                                </svg>
                                            </button>
                                            <input type="text" name="spinner" min="1" id="spinner2" onkeyup="checkSo(3)" class="spinner">
                                            <button class="btnPM" id="btnPlus2" onclick="onclickPlus2()">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
                                                </svg>
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" id="btnS" class="btn btn-primary">Xác nhận</button>
                                        </td>
                                    </tr>
								</tbody>
							</table>
						</div>
						<div class="body_right_footer">
							<button type="button" class="btn btn-success">Chọn thêm
								món</button>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script>
        function onclickMinus1(num){ 
            var sl = document.getElementById('spinner1'+num).value;
            sl--;
            document.getElementById('spinner1'+num).value = sl;
            if(sl < 1){
                document.getElementById('btnMinus1'+num).disabled = true;
            } else {
                document.getElementById('btnMinus1'+num).disabled = false;
            }
        }

        function onclickPlus1(num){
            var sl = document.getElementById('spinner1'+num).value;
            sl++;
            document.getElementById('spinner1'+num).value = sl;
            if(sl > 0){
                document.getElementById('btnMinus1'+num).disabled = false;
            }
        }

        function onclickMinus2(num){
            var sl = document.getElementById('spinner2'+num).value;
            sl--;
            document.getElementById('spinner2'+num).value = sl;
            if(sl < 1){
                document.getElementById('btnMinus2'+num).disabled = true;
            } else {
                document.getElementById('btnMinus2'+num).disabled = false;
            }
        }

        function onclickPlus2(num){
            var sl = document.getElementById('spinner2'+num).value;
            sl++;
            document.getElementById('spinner2'+num).value = sl;
            if(sl > 0){
                document.getElementById('btnMinus2'+num).disabled = false;
            }
        }

        function checkSo(num){
            var cot1 = document.getElementById('spinner1'+num).value;
            var cot2 = document.getElementById('spinner2'+num).value;
            if(cot2 > cot1){
                alert("Số lượng đã lên vượt quá Số lượng đồ ăn đang có");
                document.getElementById('btnS'+num).disabled = true;
            } else {
                document.getElementById('btnS'+num).disabled = false;
            }
        }
    </script>
	<script src="./views/Staff/js/sidebar.js"></script>
</body>

</html>