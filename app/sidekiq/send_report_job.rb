class SendReportJob
  include Sidekiq::Worker
  sidekiq_options queue: 'send_report_job', retry: false

  def perform(opts)
    user = User.find(opts['user_id'])
    diet = Diet.find(opts['diet_id'])
    ReportMailer.with(user: user, diet: diet).send_email.deliver_now
  end

end
