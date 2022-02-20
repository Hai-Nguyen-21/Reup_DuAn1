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
    <link rel="stylesheet" href="./views/Manager/css/thongkebandat.css">
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
                <div class="right_header" style="color: white; font-size: 18px;">
                    <h4 style=" margin-top: 10px;">THỐNG KÊ MENU</h4>
                </div>
                <div class="right_body--header">
                	<form action="">
                		<div class="header_search" style="width: auto;">
                        	<select style="width: 200px; float: left; margin-right: 10px;" class="form-select" aria-label="Default select example">
                            	<option value="2021">2021</option>
                            	<option value="2020">2020</option>
                            	<option value="2019">2019</option>
                        	</select>
                    		<button type="button" class="btn btn-success">Thống kê</button>
                    	</div>
                	</form>
                </div>
            </div>

            <div class="container_right_body">
                <div class="body_left l-3"></div>
                <div class="right_body l-9">
                    <div class="right_body--header-button">
                        <button type="button" style="float: left; margin-right: 50px;" class="btn btn-warning js-modal-btn">Xem biểu đồ</button>
                    </div>
                    <div class="right_body--content">
                        <table id="t1" class="table" style="text-align: center;">
                            <thead>
                                <tr>
                                    <th scope="col">MÃ MÓN</th>
                                    <th scope="col">SỐ LƯỢNG ORDER</th>
                                    <th scope="col">TỔNG TIỀN</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>MON01</td>
                                    <td>100</td>
                                    <td>10000</td>
                                </tr>
                                <tr>
                                    <td>MON01</td>
                                    <td>100</td>
                                    <td>10000</td>
                                </tr>
                                <tr>
                                    <td>MON01</td>
                                    <td>100</td>
                                    <td>10000</td>
                                </tr>
                                <tr>
                                    <td>MON01</td>
                                    <td>100</td>
                                    <td>10000</td>
                                </tr>
                                <tr>
                                    <th colspan="2">Tổng</th>
                                    <th style="color: tomato; font-size: 20px;" id="sum"></th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>

        <!--modal biểu đồ-->
        <div class="modal_chart js_modal_chart">
            <div class="modal_chart--container js_modal_chart--container">
                <svg style="float: right;" class="exit js_btn-close" xmlns="http://www.w3.org/2000/svg" width="26"
                    height="26" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
                    <path
                        d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z" />
                </svg>
                <div id="piechart_3d" style="width: 740px; height: 530px;"></div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

        // Load the Visualization API and the corechart package.
        google.charts.load('current', { 'packages': ['corechart'] });

        // Set a callback to run when the Google Visualization API is loaded.
        google.charts.setOnLoadCallback(drawChart);

        // Callback that creates and populates a data table,
        // instantiates the pie chart, passes in the data and
        // draws it.
        function drawChart() {

            // Create the data table.
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Topping');
            data.addColumn('number', 'Slices');
            data.addRows([
                ['Tháng 1', 200],
                ['Tháng 2', 100],
                ['Tháng 3', 223],
                ['Tháng 4', 199],
                ['Tháng 5', 40],
                ['Tháng 6', 45],
                ['Tháng 7', 55],
                ['Tháng 8', 60],
                ['Tháng 9', 110],
                ['Tháng 10', 80],
                ['Tháng 11', 30],
                ['Tháng 12', 80]
            ]);

            // Set chart options
            var options = {
                'title': 'Thống kê menu',
                width: 740,
                height: 530,
                is3D: true
            };

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
            chart.draw(data, options);
        }
    </script>
    <script src="./views/Manager/js/modalChart.js"></script>
    <script src="./views/Manager/js/sidebar.js"></script>
</body>

</html>