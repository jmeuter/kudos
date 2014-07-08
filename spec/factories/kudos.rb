# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :kudo do
    primary_user_id 1
    kudos_user_id 1
    honor "MyText"
  end
end
