class Player
  attr_reader :name, :symbol
  def initialize(symbol)
    @name = nil
    @symbol = symbol
  end

  def update_name(str)
    @name = str
  end
end