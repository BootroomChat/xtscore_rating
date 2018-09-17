var collapse = function (e) {
    var element = $("#" + e.target.id.replace("-btn", ""));
    if (element.hasClass('collapse')) {
        element.removeClass('collapse');
    } else {
        element.addClass('collapse');
    }
};
$(document).ready(function () {
    $('.filter-btn').on('click', collapse);
});