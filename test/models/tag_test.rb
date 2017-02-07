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

  it "has articles" do
    tag.must_respond_to :articles
  end

  it "lists only predefined regions" do
    # See tags.yml for fixtures

    Tag.regions.must_include tags(:asia)
    Tag.regions.must_include tags(:north_america)
    Tag.regions.wont_include tags(:freeway)
    Tag.regions.wont_include tags(:advance)
  end

  it "filters out predefined regions" do
    # See tags.yml for fixtures

    Tag.without_regions.wont_include tags(:asia)
    Tag.without_regions.wont_include tags(:north_america)
    Tag.without_regions.must_include tags(:freeway)
    Tag.without_regions.must_include tags(:advance)
  end
end
