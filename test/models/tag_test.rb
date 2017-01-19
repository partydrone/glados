require 'test_helper'

describe Tag do
  let(:tag) { Tag.new(name: 'detection') }

  it "is a valid object" do
    tag.must_be :valid?
  end

  it "must have a name" do
    tag.name = ' '
    tag.wont_be :valid?
  end

  it "has taggings" do
    tag.must_respond_to :taggings
  end
end
