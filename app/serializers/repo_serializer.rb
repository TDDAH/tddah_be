class RepoSerializer
  include JSONAPI::Serializer

  attributes :id, :user, :owner, :name, :covered_percent
end