var width = 344;
var height = 458;
var player_radius = 15;

var loadData = function () {
    $.ajax({
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        url: window.location,
        dataType: 'json',
        success: function (data) {
            drawFormations(data);
        },
        failure: function (result) {
            console.error(result);
        }
    });
};

var trueY = function (y) {
    var _h = height - 8;
    return (10 - y) / 11 * _h + 1 / 11 * _h;
};

function drawFormations(data) {
    Object.keys(data).forEach(function (teamName) {
        data[teamName].forEach(function (formation) {
            var svgSelector = "svg#" + teamName + "_" + formation['formation_index'];
            var div = d3.select(".formations");
            var point = div
                .select(svgSelector)
                .attr("width", width)
                .attr("height", height)
                .attr("xmlns", "http://www.w3.org/2000/svg")
                .style("background-color", 'SlateGrey')
                .selectAll('.dataCircle')
                .data(formation['locations'])
                .enter();
            var circle = point.append('circle')
                .attr('cx', function (d, i) {
                    return (10 - d.x) / 10 * (width);
                })
                .attr('cy', function (d, i) {
                    return trueY(d.y) - player_radius;
                })
                .attr('stroke', 'white')
                .attr('stroke-width', player_radius / 7.5)
                .attr('r', function (d) {
                    return player_radius
                })
                .style("fill-opacity", 1)
                .style('fill', 'red')
                .attr("id", function (d) {
                    return teamName + '-' + d.shirt_no
                })
                .classed(teamName, true);
            var text = div
                .select(svgSelector)
                .selectAll('.dataText')
                .data(formation['locations'])
                .enter()
                .append('text')
                .attr('x', function (d, i) {
                    return (10 - d.x) / 10 * (width);
                })
                .attr('y', function (d, i) {
                    return trueY(d.y) - player_radius * 2 / 3;
                })
                .text(function (d) {
                    return d.shirt_no;
                })
                .style('fill', 'white')
                .attr("text-anchor", "middle");
            var ratingText = div
                .select(svgSelector)
                .selectAll('.dataText')
                .data(formation['locations'])
                .enter()
                .append('text')
                .attr('x', function (d, i) {
                    return (10 - d.x) / 10 * (width);
                })
                .attr('y', function (d, i) {
                    return trueY(d.y) - 3 * player_radius + 10;
                })
                .text(function (d) {
                    return "(" + d.ratings + ")";
                })
                .attr("text-anchor", "middle")
                .style('font-size', '10')
                .style('font-weight', 'bold')
                .style('fill', 'black')
//                .style('text-shadow', '1px 1px 1px #000');
            var nameText = div
                .select(svgSelector)
                .selectAll('.dataText')
                .data(formation['locations'])
                .enter()
                .append('text')
                .attr('x', function (d, i) {
                    return (10 - d.x) / 10 * (width);
                })
                .attr('y', function (d, i) {
                    return trueY(d.y) - 3 * player_radius - 2;
                })
                .text(function (d) {
                    return d.player_name;
                })
                .attr("text-anchor", "middle")
                .style('font-size', '10')
                .style('font-weight', 'bold')
                .style('fill', 'black')
//                .style('text-shadow', '1px 1px 1px #000');
            d3.select("#download-" + teamName + "-" + formation['formation_index'])
                .on("click", function () {
                    console.log(teamName + "_" + formation['formation_index']);
                    console.log(document.getElementById(teamName + "_" + formation['formation_index']));
                    saveSvgAsPng(document.getElementById(teamName + "_" + formation['formation_index']), teamName + "-" + formation['formation_index'] + ".png", {
                        left: -10,
                        top: -10
                    });
                })
        })
    })
}

// fetch data on page load
$(document).ready(function () {
    loadData();
});
