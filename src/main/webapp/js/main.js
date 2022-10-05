function getHtmlRowFromJson(data) {
    return "<tr>" +
        "<td>" + data.x + "</td>" +
        "<td>" + data.y + "</td>" +
        "<td>" + data.r + "</td>" +
        "<td>" + data.hit + "</td>" +
        "<td>" + data.clientDate + "</td>" +
        "<td>" + data.scriptWorkingTime + " ms</td>" +
        "</tr>";
}

function submitForm(board, pointsById, x, y, r) {
    $.ajax({
        type: 'POST',
        url: 'ControllerServlet',
        data: {x: x, y: y, r: r, clientDate: new Date().toLocaleString()},
        success: (data) => {
            $(".right_data #result_table tbody").append(getHtmlRowFromJson(data));

            let x = data.x, y = data.y, r = data.r, hit = data.hit;
            let point = createPoint(board, x, y, hit);
            point.showElement();
            pointsById[r].push(point);
        }
    });
}

$(document).ready(function () {
    let board = JXG.JSXGraph.initBoard('jxgbox', {boundingbox: [-6, 6, 6, -6], axis: true, showCopyright: false});

    let rInput = $('input[name="r"]');
    let resetButton = $('input[type="reset"]');

    let pointsById = {};
    rInput.each(function () {
        pointsById[$(this).val()] = [];
    });

    $.ajax({
        type: 'GET',
        url: 'ControllerServlet',
        success: (data) => {
            data.forEach(function (element) {
                $(".right_data #result_table tbody").append(getHtmlRowFromJson(element));

                let x = element.x, y = element.y, r = element.r, hit = element.hit;
                pointsById[r].push(createPoint(board, x, y, hit));
            });
        }
    });

    $('#form #submit').click(function (event) {
        if (validate_form()) {
            submitForm(board, pointsById, $('input[name="x"]:checked').val(), $('input[name="y"]').val(),
                $('input[name="r"]:checked').val());
        }
        event.preventDefault();
    });

    board.on("down", function (event) {
        if (event.button === 2 || event.target.className === 'JXG_navigation_button') {
            return;
        }
        if (check_r()) {
            let coords = board.getUsrCoordsOfMouse(event);
            submitForm(board, pointsById, coords[0], coords[1], $('input[name="r"]:checked').val());
        }
    });

    $('#form #clearTable').click(function (event) {
        $.ajax({
            type: 'DELETE',
            url: 'ControllerServlet',
            success: (data) => {
                $(".right_data #result_table tbody").html(data);
                rInput.each(function () {
                    let currentR = $(this).val();
                    pointsById[currentR].forEach(item => board.removeObject(item));
                    pointsById[currentR] = [];
                });
            }
        });
        event.preventDefault();
    });

    let drawnObjects = []
    rInput.change(function () {
        if (this.checked) {
            clearFigures(board, drawnObjects);
            const stringR = this.value, r = parseFloat(stringR);
            let rectangle = createRectangle(board, r);
            let triangle = createTriangle(board, r);
            let circle = createCircle(board, r);
            drawnObjects = [rectangle, triangle, circle];

            rInput.each(function () {
                let currentR = $(this).val();
                pointsById[currentR].forEach(item => {
                    if (currentR === stringR) {
                        item.showElement();
                    } else {
                        item.hideElement();
                    }
                });
            });
        }
    });

    resetButton.click(function () {
        clearFigures(board, drawnObjects);
        rInput.each(function () {
            let currentR = $(this).val();
            pointsById[currentR].forEach(item => item.hideElement());
        });
    });
});