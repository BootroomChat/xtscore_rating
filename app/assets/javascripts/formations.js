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

function drawFormations(data) {
    console.log(data);
    Object.keys(data).forEach(function (teamName) {
        data[teamName].forEach(function (formation) {
            var svgSelector = "svg#" + teamName + "-" + formation['formation_index'];
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
                    return (10 - d.y) / 10 * height - player_radius * 4 / 3;
                })
                .attr('stroke', 'white')
                .attr('stroke-width', player_radius / 5)
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
                    return (10 - d.y) / 10 * height - player_radius;
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
                    return (10 - d.y) / 10 * height - 3 * player_radius + 6;
                })
                .text(function (d) {
                    return "(" + d.ratings + ")";
                })
                .attr("text-anchor", "middle")
                .style('font-size', '10')
                .style('fill', 'white')
                .style('text-shadow', '1px 1px 1px #000');
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
                    return (10 - d.y) / 10 * height - 3 * player_radius - 6;
                })
                .text(function (d) {
                    return d.player_name;
                })
                .attr("text-anchor", "middle")
                .style('font-size', '10')
                .style('fill', 'white')
                .style('text-shadow', '1px 1px 1px #000');
            d3.select("#download-" + teamName + "-" + formation['formation_index'])
                .on("click", function () {
                    saveSvgAsPng(document.getElementById(teamName + "-" + formation['formation_index']), teamName + "-" + formation['formation_index'] + ".png", {left: -10});
                })
        })
    })
}

// fetch data on page load
$(document).ready(function () {
    loadData();
});