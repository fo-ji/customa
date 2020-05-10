json.array! @selected_quotations do |quotation|
  json.quotation_id           quotation.id
  json.quotation_name         quotation.name
  json.quotation_created_at   quotation.created_at.strftime('%Y/%m/%d')
  json.quotation_user_id      quotation.user_id
  json.quotation_user_sign_in current_user
end

json.array! @selected_minutes do |minute|
  json.minute_id           minute.id
  json.minute_name         minute.name
  json.minute_created_at   minute.created_at.strftime('%Y/%m/%d')
  json.minute_user_id      minute.user_id
  json.minute_user_sign_in current_user
end

json.array! @selected_others do |other|
  json.other_id           other.id
  json.other_name         other.name
  json.other_created_at   other.created_at.strftime('%Y/%m/%d')
  json.other_user_id      other.user_id
  json.other_user_sign_in current_user
end
