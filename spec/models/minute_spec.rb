require 'rails_helper'

RSpec.describe Minute, type: :model do

  describe '#create' do

    it "nameとemail、row_order、user_idが存在すれば登録できること" do
      minute = create(:minute)
      expect(minute).to be_valid
    end

    it "row_orderが存在しなくても登録できること" do
      minute = create(:minute, row_order: nil)
      expect(minute).to be_valid
    end

    it "nameがない場合は登録できないこと" do
      minute = build(:minute, name: nil)
      minute.valid?
      expect(minute.errors[:name]).to include("を入力してください")
    end

  end
end
