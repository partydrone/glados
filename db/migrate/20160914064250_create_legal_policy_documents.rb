class CreateLegalPolicyDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :legal_policy_documents do |t|
      t.string :type
      t.string :title
      t.text :body
      t.date :effective_on

      t.timestamps
    end
  end
end
