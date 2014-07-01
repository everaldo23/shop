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
    image_url    "Bread.png"
    price        "6.00"
  end     
end