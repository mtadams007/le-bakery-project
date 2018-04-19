class Pastry
  attr_reader :type
  def initialize(type)
    @type = type
  end
end

class Muffin < Pastry
  attr_reader :name, :description, :price, :pic
  def initialize(name, description, price, pic)
    super("muffin")
    @name = name
    @description = description
    @price = price
    @pic = pic
  end
end

class Cake < Pastry
  attr_reader :description, :price, :pic, :name
  def initialize(name, description, price, pic)
    super("cake")
    @name = name
    @description = description
    @price = price
    @pic = pic
  end
end

class Cookie < Pastry
  attr_reader :name, :description, :price, :pic
  def initialize(name, description, price, pic)
    super("cookie")
    @name = name
    @description = description
    @price = price
    @pic = pic
  end
end
