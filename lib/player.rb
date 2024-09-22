class Player
  def initialize(symbol)
    @symbol = symbol
  end

  def mark(coordinate)
    coordinate.replace(symbol)
  end

  private

  attr_reader :symbol
end
