class FeedbackMailer < ActionMailer::Base
  default to: "spicyoranges@icloud.com"

  def feedback_email(name, email, body)
    @name = name
    @email = email
    @body = body

    mail(from: email, subject "Feedback Alumart.cl de #{name}")
  end
end
