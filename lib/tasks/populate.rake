namespace :db do
  desc "Borrado y llenado de la base de datos"
  
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Category, Product, Editorial].each(&:delete_all)
    
    

    Category.populate 20 do |category|
      category.name         = Populator.words(1..3).titleize
      category.description  = Populator.words(1..10).titleize
    end

    Editorial.populate 5 do |editorial|
      editorial.name          = Faker::Name.name
      editorial.email         = Faker::Internet.email
      editorial.phone         = Faker::PhoneNumber.phone_number
      editorial.address       = Faker::Address.street_address
      editorial.founding_date = Faker::Time.between(100.years.ago, 10.years.ago, :all)
      
      Product.populate 10..100 do |product|          
        product.editorial_id  = editorial.id
        product.title         = Populator.words(1..5).titleize
        product.description   = Populator.sentences(2..10)
        product.price         = [4.99, 19.95, 100]
        product.created_at    = 2.years.ago..Time.now
        product.image_url     = Faker::Avatar.image("my-own-slug", "50x50")
      end
    end    
  end
end