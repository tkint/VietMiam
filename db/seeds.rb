case Rails.env
  when 'development'
    entities_list = [
        ['article', 'articles'],
        ['article_comment', 'article_comments'],
        ['recipe', 'recipes'],
        ['user_group', 'user_groups'],
        ['user', 'users']
    ]

    user_group_list = [
        ['Visitor', 0],
        ['User', 1],
        ['Admin', 10]
    ]

    user_list = [
        ['Visitor', 'Visitor', 1, 'visitor@visitor.com', 'password', 'password'],
        ['Thomas', 'Kint', 3, 't.kint@hotmail.fr', 'password', 'password']
    ]

    rights_list = [
        [1, 1, 0, 1, 0, 0],
        [1, 2, 0, 1, 0, 0],
        [1, 3, 0, 1, 0, 0],
        [1, 4, 0, 1, 0, 0],
        [1, 5, 0, 1, 0, 0],
        [2, 1, 0, 1, 0, 0],
        [2, 2, 0, 1, 0, 0],
        [2, 3, 0, 1, 0, 0],
        [2, 4, 0, 1, 0, 0],
        [2, 5, 0, 1, 0, 0],
        [3, 1, 1, 1, 1, 1],
        [3, 2, 1, 1, 1, 1],
        [3, 3, 1, 1, 1, 1],
        [3, 4, 1, 1, 1, 1],
        [3, 5, 1, 1, 1, 1]
    ]

    entities_list.each do |singular, plural|
      BaseEntity.create!(singular: singular, plural: plural)
    end

    user_group_list.each do |name, level|
      UserGroup.create(name: name, level: level)
    end

    user_list.each do |first_name, last_name, user_group_id, email, password, password_confirmation|
      User.create!(first_name: first_name, last_name: last_name, user_group_id: user_group_id, email: email, password: password, password_confirmation: password_confirmation)
    end

    rights_list.each do |user_group_id, base_entity_id, right_create, right_read, right_update, right_delete|
      Right.create!(user_group_id: user_group_id, base_entity_id: base_entity_id, right_create: right_create, right_read: right_read, right_update: right_update, right_delete: right_delete)
    end
  when 'production'
    entities_list = [
        ['article', 'articles'],
        ['article_comment', 'article_comments'],
        ['recipe', 'recipes'],
        ['user_group', 'user_groups'],
        ['user', 'users']
    ]

    user_group_list = [
        ['Visitor', 0],
        ['User', 1],
        ['Admin', 10]
    ]

    user_list = [
        ['Visitor', 'Visitor', 1, 'visitor@visitor.com', 'password', 'password'],
        ['Thomas', 'Kint', 3, 't.kint@hotmail.fr', 'password', 'password']
    ]

    rights_list = [
        [1, 1, 0, 1, 0, 0],
        [1, 2, 0, 1, 0, 0],
        [1, 3, 0, 1, 0, 0],
        [1, 4, 0, 1, 0, 0],
        [1, 5, 0, 1, 0, 0],
        [2, 1, 0, 1, 0, 0],
        [2, 2, 0, 1, 0, 0],
        [2, 3, 0, 1, 0, 0],
        [2, 4, 0, 1, 0, 0],
        [2, 5, 0, 1, 0, 0],
        [3, 1, 1, 1, 1, 1],
        [3, 2, 1, 1, 1, 1],
        [3, 3, 1, 1, 1, 1],
        [3, 4, 1, 1, 1, 1],
        [3, 5, 1, 1, 1, 1]
    ]

    entities_list.each do |singular, plural|
      BaseEntity.create!(singular: singular, plural: plural)
    end

    user_group_list.each do |name, level|
      UserGroup.create(name: name, level: level)
    end

    user_list.each do |first_name, last_name, user_group_id, email, password, password_confirmation|
      User.create!(first_name: first_name, last_name: last_name, user_group_id: user_group_id, email: email, password: password, password_confirmation: password_confirmation)
    end

    rights_list.each do |user_group_id, base_entity_id, right_create, right_read, right_update, right_delete|
      Right.create!(user_group_id: user_group_id, base_entity_id: base_entity_id, right_create: right_create, right_read: right_read, right_update: right_update, right_delete: right_delete)
    end
end
