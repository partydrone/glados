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
        var label_added = label.prev().prev();
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
                //training_events.prerequisites.pop(title);
                training_events.getPrerequisitesList(training_card).forEach(function(item) {
                    training_events.prerequisites.pop(item);
                });


            }
            if (training_card.find(".wait-listed").length > 0) {
                //pop title out of waitlisted array
                training_events.waitlisted.pop(title);
            }
            label_added.hide();
            training_card.css({ "border-color": "#e6e6e6", "border-width": "2px", "border-style": "solid" });
        } else {
            //add the title to the courses list            
            training_events.list.push(title);
            training_events.course_num.push(course_id);

            if (training_card.find(".prerequisites").length > 0) {
                //push title into the prerequisite array
                //training_events.prerequisites.push(title);
                training_events.getPrerequisitesList(training_card).forEach(function(item) {
                    training_events.prerequisites.push(item);
                });

            }
            if (training_card.find(".wait-listed").length > 0) {
                //push title into the waitlisted array
                training_events.waitlisted.push(title);
            }
            label_added.show();
            training_card.css({ "border-color": "#54a4da", "border-width": "2px", "border-style": "solid" });
        }
        training_events.showEnrollmentList();
        //this is for training event requests
        training_events.showRequestCoursesList();


    }, //end course check


    //displays the courses they've checked in the enrollment list box or default message
    showEnrollmentList: function() {
        var enrollment_list = $(".enrollment-list");
        enrollment_list.empty();
        if (training_events.list.length > 0) {
            enrollment_list.append("<label>My Courses<label><ul>");
            for (i = 0; i < training_events.list.length; ++i) {
                enrollment_list.append("<li>" + training_events.list[i] + "</li>");
            }
            enrollment_list.append("</ul>");
        } else {
            enrollment_list.append('<label>My Courses<label><div class="enrollment-notice">Click + on the course description to add it to your list</div>');
        }

    },
    showRequestCoursesList: function() {
        var request_list = $("#requested-courses-list");
        request_list.empty();
        if (training_events.list.length > 0) {
            for (i = 0; i < training_events.list.length; ++i) {
                request_list.append("<div>" + training_events.list[i] + "</div>");
            }
        } else {
            request_list.append(' <p>Click + on the course description below to add it to the list</p>');
        }
    },
    validateCourses: function() {
        //check if user selected course
        if (training_events.list.length <= 0) {
            $(".enrollment_warning").html(" You much select at least one course.");

            return false;
        }
        // display displayAlert if HAS prerequisites or waitlisted courses
        if (training_events.waitlisted.length > 0 || training_events.prerequisites.length > 0) {
            if (training_events.getDisplayAlert()) {
                training_events.displayCourseAlerts();
                return false;
            }
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
            var prerequisite_list = training_events.removeDuplicates();

            html += "<h3 style='text-align: center;'>Prerequisite Required</h3><p>You have selected courses that require these prerequisites:</p><div class='enrollment-show-list'><ul>";
            prerequisite_list.forEach(function(course) {
                html += "<li>" + course + "</li>";
            });
            html += "</ul></div><p></p><p>Please confirm that you have completed these required courses before proceeding</p><div class='enrollment-gap'></div>";
        }
        if (training_events.waitlisted.length > 0) {
            html += "<h3 style='text-align: center;'>Waitlist</h3><p>You have selected courses that are currently full:</p><div class='enrollment-show-list'><ul>";
            training_events.waitlisted.forEach(function(course) {
                html += "<li>" + course + "</li>";
            });
            html += "</ul></div><p></p><p>You will be placed on a waitlist and notified if a spot becomes available.</p>";

        }

        return html;
    },

    //gets the list of prerequesites for a given traning event course
    getPrerequisitesList: function(training_card) {
        var prereq_list = [];
        var i = 1;
        var prereq = training_card.find("#prereq-" + i);
        while (prereq.length > 0) {
            prereq_list.push(prereq[0].innerHTML);
            prereq = training_card.find("#prereq-" + ++i);
        }
        return prereq_list;
    },

    //remove duplicates to show unquie prerequisites
    removeDuplicates: function() {
        var unique_prerequisites = [];
        $.each(training_events.prerequisites, function(i, el) {
            if ($.inArray(el, unique_prerequisites) == -1) {
                unique_prerequisites.push(el);
            }
        });
        return unique_prerequisites;
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