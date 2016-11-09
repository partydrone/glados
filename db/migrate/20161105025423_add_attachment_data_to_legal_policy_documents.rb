class AddAttachmentDataToLegalPolicyDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :legal_policy_documents, :attachment_data, :text
  end
end
