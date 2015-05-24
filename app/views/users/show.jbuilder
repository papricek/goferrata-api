if @user.errors.blank?
  json.user do
    json.id         @user.id
    json.first_name @user.first_name
    json.last_name  @user.last_name
    json.email      @user.email
    json.token      @user.token
  end
else
  json.errors @user.errors.messages do |column, errors|
    json.title "#{column.to_s.humanize} #{errors.join(", ")}"
    json.status 400
  end
end
