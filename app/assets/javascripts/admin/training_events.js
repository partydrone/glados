//namespace--------------------------------------------------------------------------------------
var training_events = {

    displayAlert: false,
    prerequisites: [],
    waitlisted: [],

    //this function is called when user adds a course
    //1. checks to see if the course has prerequisites
    //2. checks to see if the course waitlisted(not enough seats available)
    //3. push and pop titles in/out of arrays to display to user
    courseCheck: function(check_box) {
        var child = check_box.children('input');
        var parent = check_box.parent();
        //add to array if checked
        if (child[0].checked) {
            if (parent.find(".prerequisites").length > 0) {
                //push title into the prerequisite array
                training_events.prerequisites.push(parent.find(".prerequisites").attr('id'));
            } else if (parent.find(".wait-listed").length > 0) {
                //push title into the waitlisted array
                training_events.waitlisted.push(parent.find(".wait-listed").attr('id'));
            }
        }
        //remove from array if unchecked
        else {
            if (parent.find(".prerequisites").length > 0) {
                //pop title out of prerequisites array
                training_events.prerequisites.pop(parent.find(".prerequisites").attr('id'));
            } else if (parent.find(".wait-listed").length > 0) {
                //pop title out of waitlisted array
                training_events.waitlisted.pop(parent.find(".wait-listed").attr('id'));
            }
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
