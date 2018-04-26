// ajax call to fetch json
var loadData = function(){
    $.ajax({
        type: 'GET',
        contentType: 'application/json; charset=utf-8',
        url: window.location,
        dataType: 'json',
        success: function(data){
            drawFormations(data);
        },
        failure: function(result){
            error();
        }
    });
};

function error() {
    console.error("Something went wrong!");
}

// draw bar plot
function drawFormations(data){
    console.log(data);
}

// fetch data on page load
$(document).ready(function(){
    loadData();
});