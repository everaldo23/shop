FactoryGirl.define do
  factory :user do
    sequence(:name)     { |n| "Person #{n}"}
    sequence(:email)    { |n| "person_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"
    
    factory :admin do
      admin true
    end
  end
  
  factory :product do
    title        "Bread"
    description  "This is a piece of bread"
    price        "6.00"
    brand        "GlaxoSmithKline"
    category     "Books"
    shopphoto    "http://shopphoto.s3.amazonaws.com/products/shopphotos/000/000/003/square/corelle3.jpg?1404284586"
  end     
end