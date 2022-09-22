function createRectangle(board, r) {
    let rectanglePoint1 = board.create('point', [0, 0], {name: '', fixed: true});
    let rectanglePoint2 = board.create('point', [r, 0], {name: '', fixed: true});
    let rectanglePoint3 = board.create('point', [r, -r / 2], {name: '', fixed: true});
    let rectanglePoint4 = board.create('point', [0, -r / 2], {name: '', fixed: true});
    return board.create('polygon', [rectanglePoint1, rectanglePoint2, rectanglePoint3, rectanglePoint4],
        {fillColor: '#3399ff', fillOpacity: 1});
}

function createTriangle(board, r) {
    let trianglePoint1 = board.create('point', [0, 0], {name: '', fixed: true});
    let trianglePoint2 = board.create('point', [r, 0], {name: '', fixed: true});
    let trianglePoint3 = board.create('point', [0, r], {name: '', fixed: true});
    return board.create('polygon', [trianglePoint1, trianglePoint2, trianglePoint3], {fillColor: '#3399ff'});
}

function createCircle(board, r) {
    let p1 = board.create('point', [-r / 2, 0], {name: '', fixed: true});
    let p2 = board.create('point', [-r / (2 * Math.sqrt(2)), r / (2 * Math.sqrt(2))], {name: '', fixed: true});
    let p3 = board.create('point', [0, r / 2], {name: '', fixed: true});
    let circleCenter = board.create('point', [0, 0], {name: '', fixed: true});
    return board.create('circumcirclesector', [p1, p2, p3], {fillColor: '#3399ff', center: circleCenter});
}

$(document).ready(function () {
    let board = JXG.JSXGraph.initBoard('jxgbox', {boundingbox: [-6, 6, 6, -6], axis: true, showCopyright: false});

    document.getElementById('jxgbox').addEventListener("click", function (event) {
        if (check_r()) {
            board.create("point", board.getUsrCoordsOfMouse(event));
        }
    });

    let drawnObjects = []
    $('input[type="radio"][name="r"]').change(function () {
        check_r();
        if (this.checked) {
            for (const object of drawnObjects) {
                let points = object.ancestors;
                for (const point in points) board.removeObject(point);
                board.removeObject(object);
            }
            const r = parseFloat(this.value);
            let rectangle = createRectangle(board, r);
            let triangle = createTriangle(board, r);
            let circle = createCircle(board, r);
            drawnObjects = [rectangle, triangle, circle];
        }
    });
});