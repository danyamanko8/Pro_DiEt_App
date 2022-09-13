class ReportMailer < ApplicationMailer
  def send_email
    @user = params[:user]
    @diet = params[:diet]
    mail(to: @user.email, subject: 'ProDietApp Report')
  end
end
