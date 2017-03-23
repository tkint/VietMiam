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

    # user_group_id
    # base_entity_id
    # create
    # read
    # update_self
    # update_lesser_group
    # update_actual_group
    # update_upper_group
    # delete_self
    # delete_lesser_group
    # delete_actual_group
    # delete_upper_group
    rights_list = [
        [1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        [1, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        [1, 3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        [1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [2, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        [2, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        [2, 3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        [2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [2, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
        [3, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
        [3, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
        [3, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
        [3, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
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

    rights_list.each do |uid, eid, c, r, us, ul, ua, uu, ds, dl, da, du|
      Right.create!(user_group_id: uid, base_entity_id: eid, right_create: c, right_read: r, right_update_self: us, right_update_lesser_group: ul, right_update_actual_group: ua, right_update_upper_group: uu, right_delete_self: ds, right_delete_lesser_group: dl, right_delete_actual_group: da, right_delete_upper_group: du)
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
        ['Visitor', 'Visitor', 4, 'visitor@visitor.com', 'password', 'password'],
        ['Thomas', 'Kint', 24, 't.kint@hotmail.fr', 'password', 'password']
    ]

    rights_list = [
        [4, 4, 0, 1, 0, 0],
        [4, 14, 0, 1, 0, 0],
        [4, 24, 0, 1, 0, 0],
        [4, 34, 0, 1, 0, 0],
        [4, 44, 0, 1, 0, 0],
        [14, 4, 0, 1, 0, 0],
        [14, 14, 0, 1, 0, 0],
        [14, 24, 0, 1, 0, 0],
        [14, 34, 0, 1, 0, 0],
        [14, 44, 0, 1, 0, 0],
        [24, 4, 1, 1, 1, 1],
        [24, 14, 1, 1, 1, 1],
        [24, 24, 1, 1, 1, 1],
        [24, 34, 1, 1, 1, 1],
        [24, 44, 1, 1, 1, 1]
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
