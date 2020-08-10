require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品機能' do
    before do
      user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: user.id)
      @item.image = fixture_file_upload('public/images/test-500x500.png')
    end

    it '全ての値が正しく入力されていれば登録できること' do
      expect(@item).to be_valid
    end

    it 'imageが空では出品できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では出品できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'explanationが空では出品できないこと' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'category_idが空では出品できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category select')
    end

    it 'status_idが空では出品できないこと' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Status select')
    end

    it 'shipping_fee_idが空では出品できないこと' do
      @item.shipping_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee select')
    end

    it 'shipping_origin_idが空では出品できないこと' do
      @item.shipping_origin_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping origin select')
    end

    it 'shipping_date_idが空では出品できないこと' do
      @item.shipping_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping date select')
    end

    it 'priceが空では出品できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが¥300~¥9,999,999の間でなければ出品できないこと' do
      @item.price = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
  end
end
