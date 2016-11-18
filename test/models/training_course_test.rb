require 'test_helper'

describe TrainingCourse do
  let(:training_course) { TrainingCourse.new(title: 'Wiring SmartSensor HD', description: 'Learn to wire a SmartSensor HD with your eyes closed.', number: '501', duration: 4, seats: 25, training_course_type_id: training_course_types(:workshop).id) }

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

  it "has seats" do
    training_course.must_respond_to :seats
  end

  it "doesn't require seats" do
    training_course.seats = ''
    training_course.must_be :valid?
  end

  it "doesn't allow seats to have a text value" do
    training_course.seats = '12 seats'
    training_course.wont_be :valid?
  end

  it "requires seats be a number" do
    training_course.seats = 25
    training_course.must_be :valid?
  end

  it "generates a full title with a course number" do
    training_course.full_title.must_equal "#{training_course.number} - #{training_course.title}"
  end

  it "generates a full title without a course number" do
    training_course.number = ''
    training_course.full_title.must_equal "#{training_course.title}"
  end
end
