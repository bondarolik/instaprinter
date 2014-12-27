class FeedbackMailer < ActionMailer::Base
  #default to: "gobets96@gmail.com"
  default to: "ventas@alumart.cl"

  def feedback_email(name, email, body)
    @name = name
    @email = email
    @body = body
    #delivery_options = { user_name: "ventas@alumart.cl", password: "starsfgd", address: "smtp.gmail.com" }

    mail(from: email, subject: "Feedback Alumart.cl de #{name}")
  end
end
