class Movie
  include Mongoid::Document
  include Mongoid::Slug
  field :title

  slug  :title, history: true, only_match_newest: true
end
