FactoryBot.define do
  factory :order_delivery do
    post_code                   { '123-4567' }
    prefecture_id               { 2 }
    municipality                { '北広島市' }
    address_number              { '12-7' }
    building                    { '道産子ハイツ' }
    phone_number                { '00012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
