require 'test_helper'

describe CaseStudy do
  let(:case_study) { CaseStudy.new(title: 'Case Study Title', subtitle: 'Case study subtitle', location: 'Wisconsin', flag: 'us', body: 'Case study body text.', posted_on: Date.yesterday.to_s(:db), hero_image_id: 1) }

  it "is a valid object" do
    case_study.must_be :valid?
  end

  it "requires a subtitle" do
    case_study.subtitle = ' '
    case_study.wont_be :valid?
  end

  it "requires a location" do
    case_study.location = ' '
    case_study.wont_be :valid?
  end

  it "requires a flag" do
    case_study.flag = nil
    case_study.wont_be :valid?
  end
end
