FactoryGirl.define do
  factory :task do
    contact "John"
    status rand(0..2)
  end
end
