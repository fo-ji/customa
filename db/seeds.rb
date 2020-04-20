5.times do |n|

  Client.create!(
    company_name:      "テスト#{n + 1}株式会社",
    responsible_party: "テスト次郎#{n + 1}",
    address:           "東京都中央区銀座#{n + 1}-#{n + 1}",
    postal_code:       "123-456#{n + 1}",
    phone_number:      "03-4443-234#{n + 1}",
    email:             "test1#{n + 1}@test.com",
    id:                "#{n + 1}",
    user_id:           "6"
  )

  Quotation.create!(
    name:      "見積書テスト#{n + 1}",
    row_order: "#{n + 1}",
    id:        "#{n + 1}",
    client_id: "#{n + 1}"
  )

  Minute.create!(
    name:      "議事録テスト#{n + 1}",
    row_order: "#{n + 1}",
    id:        "#{n + 1}",
    client_id: "#{n + 1}"
  )

  Other.create!(
    name:      "その他テスト#{n + 1}",
    row_order: "#{n + 1}",
    id:        "#{n + 1}",
    client_id: "#{n + 1}"
  )

end

2.times do |n|

  Document.create!(
    document:     File.open("./app/assets/images/test#{n +1}.jpg"),
    quotation_id: "#{n + 1}",
    id:           "#{n + 1}",
  )

  Document.create!(
    document:     File.open("./app/assets/images/test#{n +1}.jpg"),
    minute_id:    "#{n + 1}",
    id:           "#{n + 10}",
  )

  Document.create!(
    document:     File.open("./app/assets/images/test#{n + 1}.jpg"),
    other_id:     "#{n + 1}",
    id:           "#{n + 20}",
  )

end
