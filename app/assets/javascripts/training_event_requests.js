$(function() {

    $(".request_types_list").change(function() {
        var request_type = this.value;
        //HTML collection
        var requests = $(".show-request-list").children();

        //show all if all courses is selected
        if (request_type == "request-type-all") {
            requests.show();
            return;
        }
        //hide all course cards
        requests.hide();

        //show courses that have the same course-type-id
        for (var i = 0; i < requests.length; ++i) {
            if (requests[i].getAttribute("data-request-type") == request_type) {
                requests[i].style.display = "inline-block";
            }
        }

    });

});