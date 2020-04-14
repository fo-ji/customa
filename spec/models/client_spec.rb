require 'rails_helper'

RSpec.describe Client, type: :model do

  describe '#create' do
    
    it "company_nameとemail、responsible_party、postal_code、address、phone_number、user_idが存在すれば登録できること" do
      client = create(:client)
      expect(client).to be_valid
    end

    it "company_nameがない場合は登録できないこと" do
      client = build(:client, company_name: nil)
      client.valid?
      expect(client.errors[:company_name]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      client = build(:client, email: nil)
      client.valid?
      expect(client.errors[:email]).to include("を入力してください")
    end

    it "responsible_partyがない場合は登録できないこと" do
      client = build(:client, responsible_party: nil)
      client.valid?
      expect(client.errors[:responsible_party]).to include("を入力してください")
    end

    it "postal_codeがない場合は登録できないこと" do
      client = build(:client, postal_code: nil)
      client.valid?
      expect(client.errors[:postal_code]).to include("を入力してください")
    end

    it "addressがない場合は登録できないこと" do
      client = build(:client, address: nil)
      client.valid?
      expect(client.errors[:address]).to include("を入力してください")
    end

    it "phone_numberがない場合は登録できないこと" do
      client = build(:client, phone_number: nil)
      client.valid?
      expect(client.errors[:phone_number]).to include("を入力してください")
    end

    it "user_idがない場合は登録できないこと" do
      client = build(:client, user_id: nil)
      client.valid?
      expect(client.errors[:user_id]).to include("を入力してください")
    end

    it "postal_codeがハイフンを含む半角8文字であれば登録できること" do
      client = create(:client, postal_code: "098-1234")
      expect(client).to be_valid
    end

    it "postal_codeが全角入力の場合は登録できないこと" do
      client = build(:client, postal_code: "０９８−１２３４")
      client.valid?
      expect(client.errors[:postal_code]).to include("は不正な値です")
    end

    it "postal_codeがハイフンの入力がない場合は登録できないこと" do
      client = build(:client, postal_code: "09812345")
      client.valid?
      expect(client.errors[:postal_code]).to include("は不正な値です")
    end

    it "phone_numberが半角ハイフンを含んだ1〜4桁・1〜4桁・3〜4桁の半角数字の形式であれば登録できること" do
      client = create(:client, phone_number: "0934-1234-1234")
      expect(client).to be_valid
    end

    it "phone_numberが全角入力の場合は登録できないこと" do
      client = build(:client, phone_number: "０９３４−１２３４−１２３４")
      client.valid?
      expect(client.errors[:phone_number]).to include("は不正な値です")
    end

    it "phone_numberがハイフンが1つの場合は登録できないこと" do
      client = build(:client, phone_number: "09341234-1234")
      client.valid?
      expect(client.errors[:phone_number]).to include("は不正な値です")
    end

    it "phone_numberが半角ハイフン、数字以外の形式で入力された場合は登録できないこと" do
      client = build(:client, phone_number: "0p34-12e4-12u4")
      client.valid?
      expect(client.errors[:phone_number]).to include("は不正な値です")
    end

  end
end
