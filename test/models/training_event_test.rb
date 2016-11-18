require 'test_helper'

describe TrainingEvent do
  let(:training_event) { TrainingEvent.new(title: 'New Training Event', description: "This is a cool new training event you won't want to miss", started_at: 1.day.from_now.to_s(:db), ended_at: 3.days.from_now.to_s(:db), location: 'Orlando, Florida') }

  it "must be a valid object" do
    training_event.must_be :valid?
  end

  it "requires a title" do
    training_event.title = ' '
    training_event.wont_be :valid?
  end

  it "requires a description" do
    training_event.description = ' '
    training_event.wont_be :valid?
  end

  it "requires a start date" do
    training_event.started_at = ' '
    training_event.wont_be :valid?
  end

  it "requires an end date" do
    training_event.ended_at = ' '
    training_event.wont_be :valid?
  end

  it "starts before it ends" do
    training_event.started_at = 3.days.from_now.to_s(:db)
    training_event.ended_at = 1.day.from_now.to_s(:db)
    training_event.wont_be :valid?
  end

  it "requires a location" do
    training_event.location = ' '
    training_event.wont_be :valid?
  end
end
