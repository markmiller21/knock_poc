module ApplicationHelper
  def real_img_or_gu_logo(url_path_str)
    url_path_str.present? ? url_path_str : User::default_avatar_path
  end
end
