var width = 344;
var height = 458;
var player_radius = 16;

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


// draw bar plot
function drawFormations(data) {
    console.log(data);
    Object.keys(data).forEach(function (teamName) {
        data[teamName].forEach(function (formation) {
            var svg = d3.select(".formations")
                .append("svg:svg")
                .attr("width", width)
                .attr("height", height)
                .style("background-color", 'GreenYellow');
            var point = svg.selectAll('.dataCircle')
                .data(formation['locations'])
                .enter();
            var circle = point.append('circle')
                .attr('cx', function (d, i) {
                    return d.x / 10 * (width);
                })
                .attr('cy', function (d, i) {
                    return d.y / 10 * height + player_radius;
                })
                .attr('stroke', 'white')
                .attr('stroke-width', player_radius / 4)
                .attr('r', function (d) {
                    return player_radius
                })
                .style("fill-opacity", 1)
                .style('fill', 'red')
                .style("stroke-opacity", player_radius / 5)
                .attr("id", function (d) {
                    return teamName + '-' + d.shirt_no
                })
                .classed(teamName, true);
        })
    })
}

// fetch data on page load
$(document).ready(function () {
    loadData();
});