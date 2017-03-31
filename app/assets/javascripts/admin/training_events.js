//namespace--------------------------------------------------------------------------------------
var training_events = {

    displayAlert: false,
    prerequisites: [],
    waitlisted: [],

    //this function is called when user adds a course
    //1. checks to see if the course has prerequisites
    //2. checks to see if the course waitlisted(not enough seats available)
    //3. push and pop titles in/out of arrays to display to user    
    courseCheck: function(label) {
        var check_box = label.prev();
        var training_card = label.parent().parent().parent();

        //remove from array
        if (check_box[0].checked) {
            if (training_card.find(".prerequisites").length > 0) {
                //pop title out of prerequisites array
                training_events.prerequisites.pop(training_card.find(".prerequisites").attr('id'));
            }
            if (training_card.find(".wait-listed").length > 0) {
                //pop title out of waitlisted array
                training_events.waitlisted.pop(training_card.find(".wait-listed").attr('id'));
            }
            training_card.css({ "border-color": "#e6e6e6", "border-width": "2px", "border-style": "solid" });
        }
        //add to array
        else {
            if (training_card.find(".prerequisites").length > 0) {
                //push title into the prerequisite array
                training_events.prerequisites.push(training_card.find(".prerequisites").attr('id'));
            }
            if (training_card.find(".wait-listed").length > 0) {
                //push title into the waitlisted array
                training_events.waitlisted.push(training_card.find(".wait-listed").attr('id'));
            }
            training_card.css({ "border-color": "#54a4da", "border-width": "2px", "border-style": "solid" });
        }

    }, //end course check

    validateCourses: function() {
        // display displayAlert if HAS prerequisites or waitlisted courses
        if (training_events.getDisplayAlert()) {
            alert("you have waitlisted or prerequisites!"); //here is where we will unhide alert div
            return false;
        }
        return true;
    },

    //gets the status of displayAlert
    getDisplayAlert: function() {
        //check arrays to see if we have any prerequisites or waitlisted courses
        if (training_events.waitlisted.length > 0 || training_events.prerequisites.length > 0) {
            return true;
        }
        return false;
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



//checkbox event
$('.input_class_checkbox').each(function() {
    $(this).hide().after('<div class="class_checkbox" />');

});

$('.class_checkbox').on('click', function() {
    $(this).toggleClass('checked').prev().prop('checked', $(this).is('.checked'))
});