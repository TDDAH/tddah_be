class RepoSerializer

  include JSONAPI::Serializer

  attributes :owner, :name

  attribute :id do |repo|
    repo.id
  end
end