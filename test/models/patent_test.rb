require 'test_helper'

describe Patent do
  let(:patent) { Patent.new(number: 1234567890, title: 'The Coolest Sensor Ever Created') }

  it "is a valid object" do
    patent.must_be :valid?
  end

  it "requires a number" do
    patent.number = ' '
    patent.valid?.wont_equal true
  end

  it "requires a valid number" do
    patent.number = 'abcd'
    patent.valid?.wont_equal true
  end

  it "requires a unique number" do
    duplicate_patent = patent.dup
    duplicate_patent.save
    patent.valid?.wont_equal true
  end

  it "requires a title" do
    patent.title = ' '
    patent.valid?.wont_equal true
  end

  it "has associated products" do
    patent.must_respond_to :products
  end
end
