require 'test_helper'

describe TrainingController, :locale do
  it "gets index" do
    get training_path
    must_respond_with :success
  end
end
