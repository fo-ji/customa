json.array! @selected_quotations do |quotation|
  json.id         quotation.id
  json.name       quotation.name
  json.created_at quotation.created_at.strftime('%Y/%m/%d')
end
