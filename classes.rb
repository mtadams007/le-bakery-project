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

#Cakes

$carrot = Cake.new("Carrot Cake", "A tasty cake made with organic carrots imported from Mbabane, Swaziland is better than gold!", '$450', "/images/carrot_cake.jpeg")

$vanilla = Cake.new("Vanilla Cake", "A delicious cake made with imported vanilla from Ranomafana, Madagascar will make you the best you've ever bean!", '$500', "/images/vanilla_cake.jpeg")

$strawberry = Cake.new("Strawberry Cake", "You'll never draw the shortest straw with this scrumptious cake made with strawberries from Mongolia!", '$400', "/images/strawberry_cake.jpeg")

#Muffins

$cupcake = Muffin.new("Chocolate Cupcake", "A delicious sweet cupcake topped with chocolate icing", '$5', '/images/choco_muffin.jpeg')

$chocolate_muffin = Muffin.new("Chocolate Muffin", "A tasty dark chocolate muffin", '$4.34','/images/chocolate_muffin.jpeg')

$blueberry = Muffin.new("Blueberry Muffin", "An old favorite that is super tasty. The one time it's good to feel blue! We trained rabbits to pick the blueberries", "$3.21", "/images/blueberry_muffin.jpeg")

$choco_chip = Cookie.new("Chocolate Chip Cookie", "Everyone will want to chip in to finish this favorite cookie! Made with goat's milk chocolate.", "$1.43", "/images/choco_chip_cookie.jpeg")

$christmas = Cookie.new("Christmas Cookies", "Yule love these cookies! Celebrate Christmas any time of the year! Made with all natural ingredients from Norway.", "$1.37", "/images/christmas_cookies.jpeg")

$green = Cookie.new("Green Cookie", "A super healthy cookie that is also good for the environment. Your friends will turn green from envy! Made with kale, spinach, and iceberg lettuce", "$0.23", "/images/green_cookie.jpeg")

$cake_hash = {
  cake_1: $carrot,
  cake_2: $vanilla,
  cake_3: $strawberry
}

$cookie_hash = {
  cookie_1: $choco_chip,
  cookie_2: $christmas,
  cookie_3: $green
}

$muffin_hash = {
  muffin_1: $cupcake,
  muffin_2: $chocolate_muffin,
  muffin_3: $blueberry
}
