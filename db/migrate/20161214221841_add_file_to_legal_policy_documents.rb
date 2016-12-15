class AddFileToLegalPolicyDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :legal_policy_documents, :file_id, :string
    add_column :legal_policy_documents, :file_filename, :string
    add_column :legal_policy_documents, :file_size, :integer
    add_column :legal_policy_documents, :file_content_type, :string

    remove_column :legal_policy_documents, :attachment_data, :text
  end
end
