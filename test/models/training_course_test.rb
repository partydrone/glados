require 'test_helper'

describe TrainingCourse do
  let(:training_course) { TrainingCourse.new(title: 'Wiring SmartSensor HD', description: 'Learn to wire a SmartSensor HD with your eyes closed.', number: '501', duration: 4, training_course_type_id: training_course_types(:workshop).id) }

  it "must be a valid object" do
    training_course.must_be :valid?
  end

  it "requires a title" do
    training_course.title = ' '
    training_course.wont_be :valid?
  end

  it "requires a description" do
    training_course.description = ' '
    training_course.wont_be :valid?
  end

  it "has a course number" do
    training_course.must_respond_to :number
  end

  it "has a duration" do
    training_course.must_respond_to :duration
  end

  it "doesn't require a duration" do
    training_course.duration = ''
    training_course.must_be :valid?
  end

  it "doesn't allow duration to have a text value" do
    training_course.duration = '1 hour'
    training_course.wont_be :valid?
  end

  it "requires duration be a number" do
    training_course.duration = 4
    training_course.must_be :valid?
  end

  it "generates a full title with a course number" do
    training_course.full_title.must_equal "#{training_course.number} - #{training_course.title}"
  end

  it "generates a full title without a course number" do
    training_course.number = ''
    training_course.full_title.must_equal "#{training_course.title}"
  end

  it "has prerequisites" do
    training_course.must_respond_to :prerequisites
  end  

  it "has multiple prerequisites" do
    tc1 = training_courses(:training_course_one)
    tc4 = training_courses(:training_course_four)
    tc5 = training_courses(:training_course_five)
    tc6 = training_courses(:training_course_six)

    tc6.prerequisites = [tc4, tc5]
    tc6.save
    tc6.reload

    tc6.prerequisites.must_include tc4
    tc6.prerequisites.must_include tc5    
    tc6.prerequisites.wont_include tc1
  end

  it "has prerequisites and is a prerequisite" do
    tc1 = training_courses(:training_course_one)
    tc2 = training_courses(:training_course_two)
    tc4 = training_courses(:training_course_four)
    tc6 = training_courses(:training_course_six)

    tc4.prerequisites = [tc1, tc2]
    tc6.prerequisites = [tc4]
    [tc4, tc6].each do |tc|
      tc.save
      tc.reload
    end

    tc4.prerequisites.must_include tc1
    tc6.prerequisites.must_include tc4
  end

  it "shares the same prerequisite" do
    tc1 = training_courses(:training_course_one)
    tc2 = training_courses(:training_course_two)
    tc3 = training_courses(:training_course_three)
    tc4 = training_courses(:training_course_four)
    tc5 = training_courses(:training_course_five)
    tc6 = training_courses(:training_course_six)

    tc4.prerequisites = [tc1, tc2]
    tc5.prerequisites = [tc1, tc2]

    [tc4, tc5].each do |tc|
      tc.save
      tc.reload
    end

    tc4.prerequisites.must_include tc1
    tc4.prerequisites.must_include tc2

    tc5.prerequisites.must_include tc1
    tc5.prerequisites.must_include tc2
  end
end
