json.array! @documents do |document|
  json.id           document.id
  json.name         document.name
  json.category     document.category
  json.date         document.created_at.strftime('%Y/%m/%d')
  json.file         document.document_url
  json.user_id      document.user_id
  json.user_sign_in current_user
end
