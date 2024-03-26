class RepoSerializer

  include JSONAPI::Serializer

  attributes :owner, :name

  attribute :id do |repo|
    repo.id.to_s
  end
end