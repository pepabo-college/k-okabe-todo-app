FactoryGirl.define do
  factory :task do
    sequence(:content){|n| "#{n}:テストTODO"}
    status [*0..2].sample

    factory :new_task do
      status { ['todo', 'doing', 'done'].sample }
    end

    factory :invalid_task do
      content nil
      status { ['todo', 'doing', 'done'].sample }
    end

  end
end
