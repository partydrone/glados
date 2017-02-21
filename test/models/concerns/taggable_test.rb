require 'test_helper'

describe Taggable do
  let(:article) { Article.create(title: 'Taggable Article Title', subtitle: 'Taggable article subtitle.', body: 'Taggable article body.', posted_on: 'Date.today.to_s(:db)') }

  it "adds a list of tags to an object" do
    article.tag_list = 'one, two, three'

    article.tags.must_include Tag.find_by(name: 'one')
    article.tags.must_include Tag.find_by(name: 'two')
    article.tags.must_include Tag.find_by(name: 'three')
  end

  it "creates a string from an object's tags" do
    article.tag_list = 'alpha, bravo, charlie'

    article.tag_list.must_equal 'alpha, bravo, charlie'
  end

  it "forces tags to lowercase" do
    article.tag_list = 'Big, LITTLE, mEdIUm'

    article.tag_list.must_equal 'big, little, medium'
  end

  it "ignores a tag list with empty or missing tags" do
    article.tag_list = 'one, two,, three, '
    article.tag_list.must_equal 'one, two, three'
  end
end
