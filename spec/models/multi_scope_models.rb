class MultiScopeModelA
  include Mongoid::Document
  include Mongoid::Slug

  field :name
  field :owner_id

  slug  :name
end

class MultiScopeModelB
  include Mongoid::Document
  include Mongoid::Slug

  field :name
  field :owner_id

  slug  :name, scope: :owner_id, other_scopes: ->(doc) { MultiScopeModelA.scoped }
end

class MultiScopeModelC
  include Mongoid::Document
  include Mongoid::Slug

  field :name
  field :owner_id

  slug  :name, scope: :owner_id, other_scopes: ->(doc) { MultiScopeModelA.where(owner_id: doc.owner_id) }
end

