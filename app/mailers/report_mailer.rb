class ReportMailer < ApplicationMailer
  def send_email
    @user = params[:user]
    @diet = params[:diet]
    @meals = @user.meals.where(eat_time: 1.day.ago..Time.now)
    mail(to: @user.email, subject: 'ProDietApp Report')
  end
end
