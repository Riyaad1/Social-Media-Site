module ApplicationHelper
  def show_sidenav?
    ![ root_path, new_user_session_path, new_user_registration_path, edit_user_registration_path ].include?(request.path)
  end
end
