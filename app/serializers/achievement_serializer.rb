class AchievementSerializer
  include JSONAPI::Serializer

  attributes :name, :criteria
end