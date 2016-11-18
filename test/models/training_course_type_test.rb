require 'test_helper'

describe TrainingCourseType do
  let(:training_course_type) { TrainingCourseType.new(name: 'Educational Event') }

  it "must be a valid object" do
    training_course_type.must_be :valid?
  end

  it "requires a name" do
    training_course_type.name = ' '
    training_course_type.wont_be :valid?
  end

  it "has associated training courses" do
    training_course_type.must_respond_to :training_courses
  end
end
