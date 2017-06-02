class ReturnMaterialAuthorizationPolicyDocument < LegalPolicyDocument
  include PgSearch
  multisearchable :against => [:title, :body]
end
