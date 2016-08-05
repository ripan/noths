password = FFaker::Internet.password

FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password password
    password_confirmation password

    factory :user_with_cart do
      after(:create) do |user|
        create(:cart, user: user)
      end
    end

  end
end
