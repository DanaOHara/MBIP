class EventMailer < ApplicationMailer

  def assignment_email(mail)
    mail(to: mail, subject: 'Se ha enviado un correo desde una tarea de Moodle.')
  end
end
