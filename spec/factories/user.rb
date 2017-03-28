FactoryGirl.define do
  sequence :first_name do |n|
    "person#{n}"
  end
  sequence :last_name do |n|
    "person#{n}"
  end
  sequence :username do |n|
    "person#{n}"
  end
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryGirl.define do
  factory :user, :class => 'User' do
    first_name
    last_name
    username
    email
    password '12345678'
    password_confirmation '12345678'
  end
end
