module ApplicationHelper
  def get_user_avatar(user_avatar)
    user_avatar.present? ? user_avatar : User::default_avatar_path
  end
end
