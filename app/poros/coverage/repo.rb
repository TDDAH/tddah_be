module Coverage
  class Repo
    attr_reader :id, :user, :owner, :name, :covered_percent

    def initialize(id:, user:, owner:, name:, covered_percent:)
      @id = id
      @user = user
      @owner = owner
      @name = name
      @covered_percent = covered_percent
    end
  end
end