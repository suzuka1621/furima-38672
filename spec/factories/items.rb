FactoryBot.define do
  factory :item do
    item                  {'本'}
    introduction          {'testtest'}
    price                 {'1980'}
    category_id           {'2'}
    item_state_id         {'2'}
    delivery_cost_id      {'2'}
    prefecture_id         {'2'}
    delivery_day_id       {'2'}
    association           :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
