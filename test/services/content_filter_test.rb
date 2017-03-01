require 'test_helper'

class BlogPost; end
class CaseStudy; end
class KnowledgeBaseArticle; end

class Feature
  def body
    'some text'
  end
end

describe ContentFilter do
  describe "filter" do
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

    it "filters out everything but marketing content" do
      blog_post  = BlogPost.new
      case_study = CaseStudy.new
      feature    = Feature.new
      kb_article = KnowledgeBaseArticle.new
      collection = [blog_post, case_study, feature, kb_article]

      ContentFilter.new(collection).filter(:marketing_content).must_include blog_post
      ContentFilter.new(collection).filter(:marketing_content).must_include case_study
      ContentFilter.new(collection).filter(:marketing_content).must_include feature

      ContentFilter.new(collection).filter(:marketing_content).wont_include kb_article
    end

    it "filters out everything but support content" do
      blog_post  = BlogPost.new
      case_study = CaseStudy.new
      feature    = Feature.new
      kb_article = KnowledgeBaseArticle.new
      collection = [blog_post, case_study, feature, kb_article]

      ContentFilter.new(collection).filter(:support_content).must_include kb_article

      ContentFilter.new(collection).filter(:support_content).wont_include blog_post
      ContentFilter.new(collection).filter(:support_content).wont_include case_study
      ContentFilter.new(collection).filter(:support_content).wont_include feature
    end
  end
end
