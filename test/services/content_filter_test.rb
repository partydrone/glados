require 'test_helper'

describe ContentFilter do
  describe "filter" do
    let(:blog_post) { BlogPost.new }
    let(:case_study) { CaseStudy.new }
    let(:kb_article) { KnowledgeBaseArticle.new }
    let(:product_feature) { Feature.new(body: 'some content') }

    it "returns an empty array if it gets an empty array" do
      collection = []
      ContentFilter.new(collection).filter(:whatever).must_equal []
    end

    it "returns an empty array if it filters everything out" do
      collection = [BlogPost.new, CaseStudy.new]
      ContentFilter.new(collection).filter(:support_content).must_equal []
    end

    it "raises an error if no filter name is passed" do
      collection = []
      -> { ContentFilter.new(collection).filter }.must_raise ArgumentError
    end

    it "doesn't do anything if nothing is filtered" do
      collection = [BlogPost.new, CaseStudy.new]
      ContentFilter.new(collection).filter(:marketing_content).must_equal collection
    end

    describe "marketing_content" do
      it "filters out everything but marketing content" do
        collection = [blog_post, case_study, product_feature, kb_article]

        ContentFilter.new(collection).filter(:marketing_content).must_include blog_post
        ContentFilter.new(collection).filter(:marketing_content).must_include case_study
        ContentFilter.new(collection).filter(:marketing_content).must_include product_feature

        ContentFilter.new(collection).filter(:marketing_content).wont_include kb_article
      end

      it "doesn't include features with no body" do
        bad_feature  = Feature.new(body: '')
        collection   = [bad_feature, product_feature]

        ContentFilter.new(collection).filter(:marketing_content).wont_include bad_feature
        ContentFilter.new(collection).filter(:marketing_content).must_include product_feature
      end
    end

    describe "support_content" do
      it "filters out everything but support content" do
        collection = [blog_post, case_study, kb_article]

        ContentFilter.new(collection).filter(:support_content).must_include kb_article

        ContentFilter.new(collection).filter(:support_content).wont_include blog_post
        ContentFilter.new(collection).filter(:support_content).wont_include case_study
      end
    end
  end
end
