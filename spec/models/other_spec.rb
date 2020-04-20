require 'rails_helper'

RSpec.describe Other, type: :model do
  describe '#create' do

    it "nameとemail、row_order、user_idが存在すれば登録できること" do
      other = create(:other)
      expect(other).to be_valid
    end

    it "row_orderが存在しなくても登録できること" do
      other = create(:other, row_order: nil)
      expect(other).to be_valid
    end

    it "nameがない場合は登録できないこと" do
      other = build(:other, name: nil)
      other.valid?
      expect(other.errors[:name]).to include("を入力してください")
    end

  end
end
