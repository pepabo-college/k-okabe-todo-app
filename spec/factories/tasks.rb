FactoryGirl.define do
  factory :task do
    sequence(:content){|n| "#{n}:テストTODO"}
    status [*0..2].sample
  end
end
