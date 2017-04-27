$(function() {

    $(".course_types_list").change(function() {
        var course_type = this.value;
        //HTML collection
        var courses = $(".show-course-list").children();

        //show all if all courses is selected
        if (course_type == "course-type-all") {
            courses.show();
            return;
        }
        //hide all course cards
        courses.hide();

        //show courses that have the same course-type-id
        for (var i = 0; i < courses.length; ++i) {
            if (courses[i].id == course_type) {
                courses[i].style.display = "inline-block";
            }
        }

    });

});