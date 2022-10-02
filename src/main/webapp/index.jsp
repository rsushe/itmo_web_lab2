<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

        .form-field input[type="radio"] {
            width: 1.3em;
            height: 1.3em;
            background-color: white;
            border-radius: 50%;
            vertical-align: middle;
            border: 1px solid black;
            appearance: none;
            cursor: pointer;
        }

        .form-field input[type="radio"]:checked {
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

        input[type="submit"], input[type="reset"], input[type="button"] {
            width: 30%;
            padding: 1em;
            margin-left: 0.5em;
            background: #cce79f;
            border: 1px solid black;
            color: black;
            text-transform: uppercase;
        }

        input[type="submit"]:hover, input[type="reset"]:hover, input[type="button"]:hover {
            background: #465c21;
            cursor: pointer;
        }

        input[type="submit"]:focus, input[type="reset"]:focus, input[type="button"]:focus {
            outline: none;
        }

        .data {
            margin: 20px;
            align-items: flex-start;
            display: flex;
        }

        .left_data {
            margin-right: 15px;
            width: 800px;
        }

        .left_data #jxgbox {
            width: 500px;
            height: 300px;
        }

        .right_data {
            width: 700px;
        }
    </style>

    <script type="text/javascript" charset="UTF-8"
            src="https://cdn.jsdelivr.net/npm/jsxgraph/distrib/jsxgraphcore.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/jsxgraph/distrib/jsxgraph.css"/>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="js/validate.js"></script>
    <script src="js/graph.js"></script>
</head>

<body>
<header>
    <span>Сущенко Роман Витальевич, группа P32131, вариант 1251</span>
</header>
<div class="data">
    <div class="left_data">
        <!-- graph div -->
        <div id="jxgbox" class="jxgbox">
        </div>
        <!-- form div -->
        <div>
            <form method="post" id="form">
                <fieldset>
                    <legend>Check hit</legend>
                    <div class="form-field" onclick="check_x()">
                        <span>Choose X:</span>
                        <input type="radio" id="x1" name="x" value="-3"><label for="x1">-3</label>
                        <input type="radio" id="x2" name="x" value="-2"><label for="x2">-2</label>
                        <input type="radio" id="x3" name="x" value="-1"><label for="x3">-1</label>
                        <input type="radio" id="x4" name="x" value="0"><label for="x4">0</label>
                        <input type="radio" id="x5" name="x" value="1"><label for="x5">1</label>
                        <input type="radio" id="x6" name="x" value="2"><label for="x6">2</label>
                        <input type="radio" id="x7" name="x" value="3"><label for="x7">3</label>
                        <input type="radio" id="x8" name="x" value="4"><label for="x8">4</label>
                        <input type="radio" id="x9" name="x" value="5"><label for="x9">5</label>
                        <div>
                            <small></small>
                        </div>
                    </div>
                    <div class="form-field" onclick="check_y()">
                        <span>Enter Y:</span>
                        <label for="y"></label><input type="text" name="y" id="y">
                        <div>
                            <small></small>
                        </div>
                    </div>
                    <div class="form-field" onclick="check_r()">
                        <span>Choose R:</span>
                        <input type="radio" id="r1" name="r" value="1"><label for="r1">1</label>
                        <input type="radio" id="r2" name="r" value="1.5"><label for="r2">1.5</label>
                        <input type="radio" id="r3" name="r" value="2"><label for="r3">2</label>
                        <input type="radio" id="r4" name="r" value="2.5"><label for="r4">2.5</label>
                        <input type="radio" id="r5" name="r" value="3"><label for="r5">3</label>
                        <div>
                            <small></small>
                        </div>
                    </div>
                    <div>
                        <input type="submit" id="submit" value="Submit">
                        <input type="reset" id="clearForm" value="Clear form">
                        <input type="button" id="clearTable" value="Clear table">
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
            <tbody>
            </tbody>
        </table>
    </div>
</div>
</body>

</html>