require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の登録' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id)
    end

    context '購入登録できる' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building(建物名)は空でも保存できること' do
        @order_address.building = " "
        expect(@order_address).to be_valid
      end
    end

    context '購入登録できない' do
      it 'postcodeが空だと保存できないこと' do
        @order_address.postcode= " "
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postcode= "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      
      it 'prefecture_idは入力必須であること' do
        @order_address.prefecture_id= " "
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")

      end
      it 'prefecture_idは1以外を選択すること' do
        @order_address.prefecture_id= 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")

      end

      it 'city(市区町村)が空だと保存できないこと' do
        @order_address.city = " "
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'address(番地)が空だと保存できないこと' do
        @order_address.address = " "
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it '電話番号が空では購入できない' do
        @order_address.tell = " "
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tell can't be blank")
      end

      it '電話番号が9桁以下では購入できない' do
        @order_address.tell = "03222111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tell is invalid. Exclude hyphen(-)")
      end

      it '電話番号が12桁以上では購入できない' do
        @order_address.tell = "0322221111444"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tell is invalid. Exclude hyphen(-)")
      end

      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @order_address.tell = "０３１１１１２２２２"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tell is invalid. Exclude hyphen(-)")
      end

      it '電話番号にハイフンが含まれていると保存できない' do
        @order_address.tell = "03-2222-1111"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tell is invalid. Exclude hyphen(-)")
      end


      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'tokenが空だと保存できないこと' do
        @order_address.token = " "
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")

      end

    end

end
end
