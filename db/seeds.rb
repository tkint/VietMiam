case Rails.env
  when 'development'
    user_group_list = [
        ['Admin', 100],
        ['User', 1]
    ]

    user_list = [
        ['Thomas', 'Kint', 1, 't.kint@hotmail.fr', 'password', 'password']
    ]

    user_group_list.each do |name, level|
      UserGroup.create(name: name, level: level)
    end

    user_list.each do |first_name, last_name, user_group_id, email, password, password_confirmation|
      User.create!(first_name: first_name, last_name: last_name, user_group_id: user_group_id, email: email, password: password, password_confirmation: password_confirmation)
    end
  when 'production'
    user_group_list = [
        ['Admin', 100],
        ['User', 1]
    ]

    user_list = [
        ['Thomas', 'Kint', 4, 't.kint@hotmail.fr', 'password', 'password']
    ]

    user_group_list.each do |name, level|
      UserGroup.create(name: name, level: level)
    end

    user_list.each do |first_name, last_name, user_group_id, email, password, password_confirmation|
      User.create!(first_name: first_name, last_name: last_name, user_group_id: user_group_id, email: email, password: password, password_confirmation: password_confirmation)
    end
end
