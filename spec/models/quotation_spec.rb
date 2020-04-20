require 'rails_helper'

RSpec.describe Quotation, type: :model do

  describe '#create' do

    it "nameとemail、row_order、user_idが存在すれば登録できること" do
      quotation = create(:quotation)
      expect(quotation).to be_valid
    end

    it "row_orderが存在しなくても登録できること" do
      quotation = create(:quotation, row_order: nil)
      expect(quotation).to be_valid
    end

    it "nameがない場合は登録できないこと" do
      quotation = build(:quotation, name: nil)
      quotation.valid?
      expect(quotation.errors[:name]).to include("を入力してください")
    end

  end
end
