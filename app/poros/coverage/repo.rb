module Coverage
  class Repo
    attr_reader :id, :user, :owner, :name, :covered_percent

    def initialize(data)
      @id = data[:id]
      @user = data[:user]
      @owner = data[:owner]
      @name = data[:name]
      @covered_percent = data[:covered_percent]
    end
  end
end