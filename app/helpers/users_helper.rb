module UsersHelper
  def user_name
    current_user.first_name + ' ' + current_user.last_name
  end

  def user_link(link_class, icon = true)
    link_to edit_user_registration_path, class: link_class do
      str = ''
      if icon
        str += '<span class="glyphicon glyphicon-user" aria-hidden="true"></span> '
      end
      str += user_name
      str.html_safe
    end
  end
end
