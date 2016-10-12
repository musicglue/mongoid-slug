class MultiScopeModelOwner
  include Mongoid::Document

  field :name
end

class MultiScopeModelA
  include Mongoid::Document
  include Mongoid::Slug

  field :name
  belongs_to :owner, class_name: "MultiScopeModelOwner"

  slug  :name
end

class MultiScopeModelB
  include Mongoid::Document
  include Mongoid::Slug

  field :name
  belongs_to :owner, class_name: "MultiScopeModelOwner"

  slug  :name, scope: :owner, other_scopes: ->(doc) { MultiScopeModelA.scoped }
end

class MultiScopeModelC
  include Mongoid::Document
  include Mongoid::Slug

  field :name
  belongs_to :owner, class_name: "MultiScopeModelOwner"

  slug  :name, scope: :owner, other_scopes: ->(doc) { MultiScopeModelA.where(owner_id: doc.owner_id) }
end

