json.array! @documents do |document|
  json.id           document.id
  json.name         document.name
  json.category     document.category
  json.user_id      document.user_id
  json.user_sign_in current_user
end