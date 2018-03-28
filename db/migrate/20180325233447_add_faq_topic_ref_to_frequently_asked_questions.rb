class AddFaqTopicRefToFrequentlyAskedQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :frequently_asked_questions, :faq_topic, foreign_key: true
  end
end
