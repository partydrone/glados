class CreateJoinTableFrequentlyAskedQuestionProduct < ActiveRecord::Migration[5.0]
  def change
    create_join_table :frequently_asked_questions, :products do |t|
      # t.index [:frequently_asked_question_id, :product_id]
      # t.index [:product_id, :frequently_asked_question_id]
    end
  end
end
