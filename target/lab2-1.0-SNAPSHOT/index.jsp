<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>Second laboratory</title>
    <meta charset="UTF-8">
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #e6f6ca;
        }

        header {
            width: 100%;
            font-size: 250%;
            font-family: serif;
            text-align: center;
            background-color: #d4ebaa;
        }

        fieldset {
            font-size: large;
            display: inline-block;
            border-color: #6e9f1f;
        }

        legend {
            text-align: center;
        }

        #result_table {
            overflow-y: scroll;
            border-collapse: collapse;
        }

        #result_table tr td,
        #result_table tr th {
            padding: 8px;
            text-align: left;
        }

        #result_table thead {
            background-color: #869374;
        }

        #result_table tbody tr:nth-child(odd) {
            background-color: #a3c46e;
        }

        #result_table tbody tr:nth-child(even) {
            background-color: #ccef93;
        }

        #result_table thead tr:hover,
        #result_table tbody tr:hover {
            background-color: #465c21;
            cursor: pointer;
        }

        .form-field {
            margin-bottom: 3%;
        }

        .form-field input[type="text"] {
            border: 1px solid black;
            font-size: 85%;
            border-radius: 6px;
        }

        .form-field input[type="checkbox"] {
            width: 1.3em;
            height: 1.3em;
            background-color: white;
            border-radius: 50%;
            vertical-align: middle;
            border: 1px solid black;
            appearance: none;
            cursor: pointer;
        }

        .form-field input[type="checkbox"]:checked {
            background-color: #6e9f1f;
        }

        .form-field input:focus {
            outline: none;
        }

        .form-field.error input {
            border-color: red;
        }

        .form-field.success input {
            border-color: green;
        }

        .form-field small {
            color: red;
        }

        input[type="submit"], input[type="button"] {
            width: 45%;
            padding: 1em;
            margin-left: 1em;
            background: #cce79f;
            border: 1px solid black;
            color: black;
            text-transform: uppercase;
        }

        input[type="submit"]:hover, input[type="button"]:hover {
            background: #465c21;
            cursor: pointer;
        }

        input[type="submit"]:focus, input[type="button"]:focus {
            outline: none;
        }

        line,
        polygon,
        path {
            fill: #cce79f;
            stroke: black;
        }

        .data {
            margin: 20px;
            align-items: flex-start;
            display: flex;
        }

        .left_data {
            margin-right: 15px;
            width: 700px;
        }

        .right_data {
            flex: 1;
        }
    </style>
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>--%>
<%--    <script src="js/script.js"></script>--%>
<%--    <script src="js/validate.js"></script>--%>
</head>

<body>
<header>
    <span>Сущенко Роман Витальевич, группа ???, вариант 1251</span>
</header>
<div class="data">
    <div class="left_data">
        <!-- graph div -->
        <div>
            <svg width="300" height="300">
                <!--Координатные оси-->
                <line x1="0" x2="300" y1="150" y2="150"></line>
                <line x1="150" x2="150" y1="0" y2="300"></line>
                <!--Стрелочки-->
                <polygon points="150,0 145,15 155,15"></polygon>
                <polygon points="300,150 285,145 285,155"></polygon>
                <!--Прямоугольник в четвертой четверти-->
                <polygon points="150,150 250,150 250,250 150,250"></polygon>
                <!--Четверть круга в третьей четверти-->
                <path d="M150,200 A50,50 90 0,1 100,150 L 150,150 Z"></path>
                <!--Треугольник во второй четверти-->
                <polygon points="150,150 50,150 150,50"></polygon>
                <!-- Подписи к осям -->
                <text x="285" y="135">X</text>
                <text x="160" y="15">Y</text>
                <!-- Метки для значений R на оси X -->
                <line x1="50" x2="50" y1="140" y2="160"></line>
                <line x1="100" x2="100" y1="140" y2="160"></line>
                <line x1="200" x2="200" y1="140" y2="160"></line>
                <line x1="250" x2="250" y1="140" y2="160"></line>
                <!-- Метки для значений R на оси Y -->
                <line x1="140" x2="160" y1="50" y2="50"></line>
                <line x1="140" x2="160" y1="100" y2="100"></line>
                <line x1="140" x2="160" y1="200" y2="200"></line>
                <line x1="140" x2="160" y1="250" y2="250"></line>
                <!-- Значения R на оси X -->
                <text x="40" y="130">-R</text>
                <text x="85" y="130">-R/2</text>
                <text x="190" y="130">R/2</text>
                <text x="245" y="130">R</text>
                <!-- Значения R на оси Y -->
                <text x="170" y="52.5">R</text>
                <text x="170" y="102.5">R/2</text>
                <text x="170" y="202.5">-R/2</text>
                <text x="170" y="252.5">-R</text>
            </svg>
        </div>
        <!-- form div -->
        <div>
            <form action="" method="POST" id="form">
                <fieldset>
                    <legend>Check hit</legend>
                    <div class="form-field">
                        <span>Choose X:</span>
                        <input type="checkbox" id="x1" name="x[]" value="-1.5"><label for="x1">-1.5</label>
                        <input type="checkbox" id="x2" name="x[]" value="-1"><label for="x2">-1</label>
                        <input type="checkbox" id="x3" name="x[]" value="-0.5"><label for="x3">-0.5</label>
                        <input type="checkbox" id="x4" name="x[]" value="0"><label for="x4">0</label>
                        <input type="checkbox" id="x5" name="x[]" value="0.5"><label for="x5">0.5</label>
                        <input type="checkbox" id="x6" name="x[]" value="1"><label for="x6">1</label>
                        <input type="checkbox" id="x7" name="x[]" value="1.5"><label for="x7">1.5</label>
                        <input type="checkbox" id="x8" name="x[]" value="2"><label for="x8">2</label>
                        <div>
                            <small></small>
                        </div>
                    </div>
                    <div class="form-field">
                        <span>Enter Y:</span>
                        <label for="y"></label><input type="text" name="y" id="y">
                        <div>
                            <small></small>
                        </div>
                    </div>
                    <div class="form-field">
                        <span>Choose R:</span>
                        <input type="checkbox" id="r1" name="r[]" value="1"><label for="r1">1</label>
                        <input type="checkbox" id="r2" name="r[]" value="2"><label for="r2">2</label>
                        <input type="checkbox" id="r3" name="r[]" value="3"><label for="r3">3</label>
                        <input type="checkbox" id="r4" name="r[]" value="4"><label for="r4">4</label>
                        <input type="checkbox" id="r5" name="r[]" value="5"><label for="r5">5</label>
                        <div>
                            <small></small>
                        </div>
                    </div>
                    <div>
                        <input type="submit" id="submit" value="Submit">
                        <input type="button" id="clear" value="Clear table">
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
    <div class="right_data">
        <table id="result_table">
            <thead>
            <tr>
                <th>X</th>
                <th>Y</th>
                <th>R</th>
                <th>Hit</th>
                <th>Local time</th>
                <th>Script working time</th>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</div>
</body>

</html>