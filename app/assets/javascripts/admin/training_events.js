//namespace--------------------------------------------------------------------------------------
var training_events = {

    displayAlert: false,
    prerequisites: [],
    waitlisted: [],
    list: [],
    course_num: [],
    //this function is called when user adds a course
    //1. checks to see if the course has prerequisites
    //2. checks to see if the course waitlisted(not enough seats available)
    //3. push and pop titles in/out of arrays to display to user    
    courseCheck: function(label) {
        var check_box = label.prev();
        var training_card = label.parent().parent().parent().parent();
        var title = training_card.attr('id');
        var course_id = label.attr('for');
        check_box.toggleClass('checked').prev().prop('checked', check_box.is('.checked'));
        //remove from array
        if (check_box[0].checked) {
            //remove the title from the courses list
            var course = training_events.list.indexOf(title);
            var number = training_events.course_num.indexOf(course_id);
            training_events.list.splice(course, 1);
            training_events.course_num.splice(number, 1);

            if (training_card.find(".prerequisites").length > 0) {
                //pop title out of prerequisites array
                training_events.prerequisites.pop(title);
            }
            if (training_card.find(".wait-listed").length > 0) {
                //pop title out of waitlisted array
                training_events.waitlisted.pop(title);
            }
            training_card.css({ "border-color": "#e6e6e6", "border-width": "2px", "border-style": "solid" });
        }
        //add to array
        else {
            //add the title to the courses list            
            training_events.list.push(title);
            training_events.course_num.push(course_id);

            if (training_card.find(".prerequisites").length > 0) {
                //push title into the prerequisite array
                training_events.prerequisites.push(title);
            }
            if (training_card.find(".wait-listed").length > 0) {
                //push title into the waitlisted array
                training_events.waitlisted.push(title);
            }
            training_card.css({ "border-color": "#54a4da", "border-width": "2px", "border-style": "solid" });
        }
        training_events.showEnrollmentList();

    }, //end course check

    //displays the courses they've checked in the enrollment list box
    showEnrollmentList() {
        var enrollment_list = $(".enrollment-list");
        enrollment_list.empty();
        for (i = 0; i < training_events.list.length; ++i) {
            enrollment_list.append("<li>" + training_events.list[i] + "<span class='enrollment-remove' for='" + training_events.course_num[i] + "'></span></li>");
        }
    },

    validateCourses: function() {
        //check if user selected course
        if (training_events.waitlisted.length <= 0 || training_events.prerequisites.length <= 0) {
            $(".enrollment_warning").html(" You much select at least one course.");
            return false;
        }
        // display displayAlert if HAS prerequisites or waitlisted courses
        if (training_events.getDisplayAlert()) {
            training_events.displayCourseAlerts();
            return false;
        }
        return true;
    },

    //gets the status of displayAlert
    getDisplayAlert: function() {
        //check arrays to see if we have any prerequisites or waitlisted courses         
        $(".enrollment_warning").html("");
        //validate client side validation
        var first_name = $("#enrollment_first_name").val();
        var last_name = $("#enrollment_last_name").val();
        var email = $("#enrollment_email").val();
        if (first_name.length <= 0 || last_name.length <= 0 || last_name.lenght <= 0 || email.length <= 0 || !training_events.validateEmail(email)) {
            return false;
        }
        return true;
    },

    //displays the course alerts for prerequisite(s) and waitlist(ed) courses
    displayCourseAlerts: function() {
        var html = training_events.buildHTML();
        $(".show-courses").html(html);
        $(".course_alerts").show();
        $(".registration").hide();
    },

    //builds the html used to show the user what prerequisite &/or waitlist courses
    buildHTML: function() {
        var html = "";

        if (training_events.prerequisites.length > 0) {
            html += "<h3>Prerequisite Required</h3><p>You have selected courses that require these prerequisites:</p><ul>";
            training_events.prerequisites.forEach(function(course) {
                html += "<li>" + course + "</li>";
            });
            html += "</ul><p></p><p>Please confirm that you have completed these required courses before proceeding</p>";
        }
        if (training_events.waitlisted.length > 0) {
            html += "<h3>Waitlist</h3><p>You have selected courses that are currently full:</p><ul>";
            training_events.waitlisted.forEach(function(course) {
                html += "<li>" + course + "</li>";
            });
            html += "</ul><p></p><p>You will be placed on a waitlist and notified if a spot becomes available.</p>";
        }

        return html;
    },

    //validates the email field for client side validation
    validateEmail: function(email) {
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        return emailReg.test(email);
    }

}; //end namespace

//jquery events-------------------------------------------------------------------------------------

//when user adds/removes any training course
$('.course-check').on('click', function(event) {
    training_events.courseCheck($(this));
});

//when user clicks trash can in enrollment-list
$(document).on('click', '.enrollment-remove', function(event) {
    var for_value = this.attributes.for.value;
    var label = $(".course-check[for='" + for_value + "'");
    var check_box = label.prev();
    training_events.courseCheck(label);
    if (check_box[0].checked == true) {
        check_box[0].checked = false;
    } else {
        check_box[0].checked = true;
    }
});

//when user clicks on the submit button validate courses
$('#submit-btn').on('click', function() {
    return training_events.validateCourses();
});

//when user clicks the cancel button
$("#cancel-btn").on('click', function() {
    $(".course_alerts").hide();
    $(".registration").show();
});

//when user confirms course-check
$("#confirm-btn").on('click', function() {
    $(function() {
        $("#enrollment_form").submit(function(event) {
            return false;
        });
    });
});

//checkbox event
$('.input_class_checkbox').each(function() {
    $(this).hide().after('<div class="class_checkbox" />');

});