require 'rails_helper'

RSpec.describe PurchaseShipment, type: :model do
  describe '購入時の配送先住所保存機能' do
    before do
      @purchase_shipment = FactoryBot.build(:purchase_shipment)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@purchase_shipment).to be_valid
    end

    it 'building_nameが空でも保存できること' do
      @purchase_shipment.building_name = nil
      expect(@purchase_shipment).to be_valid
    end

    it 'postal_codeが空では保存できないこと' do
      @purchase_shipment.postal_code = nil
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Postal code can't be blank", 'Postal code Input correctly')
    end

    it 'postal_codeにハイフンが無ければ保存できないこと' do
      @purchase_shipment.postal_code = '1234567'
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include('Postal code Input correctly')
    end

    it 'prefecture_idが空では保存できないこと' do
      @purchase_shipment.prefecture_id = nil
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include('Prefecture select')
    end

    it 'cityが空では保存できないこと' do
      @purchase_shipment.city = nil
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("City can't be blank")
    end

    it 'street_numberが空では保存できないこと' do
      @purchase_shipment.street_number = nil
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Street number can't be blank")
    end

    it 'phone_numberが空では保存できないこと' do
      @purchase_shipment.phone_number = nil
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが12桁以上では保存できないこと' do
      @purchase_shipment.phone_number = '123456789012'
      @purchase_shipment.valid?
      expect(@purchase_shipment.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
    end
  end
end
