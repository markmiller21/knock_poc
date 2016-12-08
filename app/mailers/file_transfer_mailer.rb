class FileTransferMailer < ApplicationMailer
  default from: "terrorgeek@gmail.com"

  def send_file(current_user, target_user, file_path, file_name)
    @target_user = target_user
    @current_user = current_user
    @file_name = file_name
    attachments[file_name] = File.read(file_path)
    mail(to: @target_user.email, subject: "#{current_user.display_name} just sent you a file.")
  end
end
