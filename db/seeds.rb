BasketItem.destroy_all
Item.destroy_all

items_data = [
  { name: 'Big Sprite Bottle', description: 'For the large of thirst. You asked, Sprite answered.', price: 3.00, star_rating: 3, image_filename: 'big-sprite-bottle.png' },
  { name: 'Sprite Can Classic', description: 'Timeless can design, it does not get better than this.', price: 1.00, star_rating: 5, image_filename: 'sprite-can-classic.png' },
  { name: 'Lightly-used Sprite Can', description: 'This one has seen better days. Actual Sprite sold separately.', price: 0.34, star_rating: 2, image_filename: 'lightly-used-sprite-can.png' },
  { name: 'Oldest Sprite', description: 'From a simpler time. Price not adjusted for inflation.', price: 0.10, star_rating: 4, image_filename: 'oldest-sprite.png' },
  { name: 'Small Sprite Can', description: 'Little micro-can. We cannot say how small exactly (very small).', price: 0.50, star_rating: 5, image_filename: 'small-sprite-can.png' },
  { name: 'Cranberry Sprite', description: 'Bet you did not know we did this. Well hah! We do.', price: 1.00, star_rating: 1, image_filename: 'cranberry-sprite.png' },
  { name: 'Minimalist Sprite Can', description: 'For those not looking to cause a splash. Truly the old money of sprite cans.', price: 10.00, star_rating: 5, image_filename: 'minimalist-sprite.png' },
  { name: 'Coldest One', description: 'Ice cool, ideal for cracking in male company', price: 2.00, star_rating: 3, image_filename: 'coldest-one.png' },
  { name: 'Bad Decisions Sprite', description: 'Absolutely a great idea. Regret never tasted so fresh.', price: 4.00, star_rating: 2, image_filename: 'bad-decisions-sprite.png' }
]

items_data.each do |item_data|
  item = Item.create!(item_data)
  item.image.attach(io: File.open(Rails.root.join('app/assets/images/items', "#{item_data[:name].parameterize}.png")), filename: "#{item_data[:name].parameterize}.png")
end 

puts "Seeded #{Item.count} items."
