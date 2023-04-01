require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_delivery = FactoryBot.build(:order_delivery, user_id: @user.id, item_id: @item.id)
    end

    context '購入情報の内容に問題ない場合' do
      it 'token、post_code、prefecture_id、municipality、address_number、phone_number、user_id、item_idが存在すれば登録できる' do
        expect(@order_delivery).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_delivery.building = ''
        expect(@order_delivery).to be_valid
      end
    end

    context '購入内容の内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_delivery.post_code = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが3桁ハイフン4桁の半角英数字でないと保存できないこと' do
        @order_delivery.post_code = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'postal_codeが全角数字では保存できないこと' do
        @order_delivery.post_code = '１２３４-５６７'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefecture_idが1(---)では登録できない' do
        @order_delivery.prefecture_id = '1'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @order_delivery.municipality = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'address_numberが空だと保存できないこと' do
        @order_delivery.address_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Address number can't be blank")
      end
      it 'phone_numberが空では保存できないこと' do
        @order_delivery.phone_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下では保存できないこと' do
        @order_delivery.phone_number = '123456789'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number is too short or too long")
      end
      it 'phone_numberが12桁以上では保存できないこと' do
        @order_delivery.phone_number = '123456789123'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number is too short or too long")
      end
      it 'phone_numberにハイフンが入っていると保存できないこと' do
        @order_delivery.phone_number = '123-4567-8901'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'phone_numberが全角数字は保存できないこと' do
        @order_delivery.phone_number = '１２３４５６７８９０１'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'user_idが紐づいていなければ保存できないこと' do
        @order_delivery.user_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていなければ保存できないこと' do
        @order_delivery.item_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では保存できないこと' do
        @order_delivery.token = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end