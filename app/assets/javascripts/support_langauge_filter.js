$(function() {

    $(".languages-types-list").change(function() {
        var language_type = this.value;
        //HTML collection       
        var all_courses = $(".support-download-item");

        //show all if all courses is selected
        if (language_type == "language-type-all") {
            all_courses.show();
            return;
        }
        //hide all course cards
        all_courses.hide();

        //show courses that have the same course-type-id
        for (var i = 0; i < all_courses.length; ++i) {
            if (all_courses[i].getAttribute("data-locale-type") == language_type) {
                all_courses[i].style.display = "block";
            }
        }

    });

});