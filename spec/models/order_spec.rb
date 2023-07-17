require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '寄付情報の保存' do
    before do    
      @order = FactoryBot.build(:order)
    end
  
    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid

      end
    end

    context '購入できない場合' do
      it 'itemが紐付いていないと保存できないこと' do
        @order.item = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Item must exist')

      end
      it 'userが紐付いていないと保存できないこと' do
        @order.user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('User must exist')

      end
    end
  end
end
