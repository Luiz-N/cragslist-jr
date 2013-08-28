require 'faker'

puts Faker

categories = []

10.times do
  categories << Category.create(title: Faker::Commerce.department, description: Faker::Lorem.paragraph(3))
end

categories.each { |category| 
  10.times do
    category.posts << Post.create(title: Faker::Commerce.product_name,
                                  description: Faker::Lorem.paragraph(3),
                                  price: rand(10..100),
                                  email: Faker::Internet.free_email)
  end
}
