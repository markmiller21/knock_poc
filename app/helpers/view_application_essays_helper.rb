module ViewApplicationEssaysHelper
  def real_img_or_gu_logo(url_path_str)
    url_path_str.present? ? url_path_str : User::default_your_pic_path
  end
end
