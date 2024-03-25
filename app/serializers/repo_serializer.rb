class RepoSerializer

  include JSONAPI::Serializer

  attributes :owner, :name
end