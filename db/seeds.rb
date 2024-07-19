BasketItem.destroy_all
Item.destroy_all

items_data = [
  { name: 'Oldest Sprite', description: 'From a simpler time. Price not adjusted for inflation.', price: 0.10, star_rating: 4, image_filename: 'oldest-sprite.png' },
  { name: 'Big Sprite Bottle', description: 'For the large of thirst. You asked, Sprite answered.', price: 3.00, star_rating: 3, image_filename: 'big-sprite-bottle.png' },
  { name: 'Sprite Can Classic', description: 'Timeless can design, it does not get better than this.', price: 1.00, star_rating: 5, image_filename: 'sprite-can-classic.png' },
  { name: 'Lightly-used Sprite Can', description: 'This one has seen better days. Actual Sprite sold separately.', price: 0.34, star_rating: 2, image_filename: 'lightly-used-sprite-can.png' }
]

items_data.each do |item_data|
  item = Item.create!(item_data)
  item.image.attach(io: File.open(Rails.root.join('app/assets/images/items', "#{item_data[:name].parameterize}.png")), filename: "#{item_data[:name].parameterize}.png")
end 

puts "Seeded #{Item.count} items."
