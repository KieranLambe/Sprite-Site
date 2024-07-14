Item.destroy_all

items_data = [
  { name: 'Oldest Sprite', description: 'From a simpler time. Price not adjusted for inflation.', price: 0.10, star_rating: 4 },
  { name: 'Big Sprite Bottle', description: 'For the large of thirst. You asked, Sprite answered.', price: 3.00, star_rating: 3 },
  { name: 'Sprite Can Classic', description: 'Timeless can design, it does not get better than this.', price: 1.00, star_rating: 5 },
  { name: 'Lightly-used Sprite Can', description: 'This one has seen better days. Actual Sprite sold separately.', price: 0.34, star_rating: 2 }
]

items_data.each do |item_data|
  item = Item.create!(item_data)
  item.image.attach(io: File.open(Rails.root.join('app/assets/images', "#{item_data[:name].parameterize}.png")), filename: "#{item_data[:name].parameterize}.png")
end 

puts "Seeded #{Item.count} items."
