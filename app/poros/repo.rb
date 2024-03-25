class Repo
  attr_reader :owner, :name

  def initialize(data)
    @owner = data[:owner]
    @name = data[:name]
  end
end