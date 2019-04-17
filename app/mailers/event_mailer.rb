class EventMailer < ApplicationMailer

  def assignment_email(event)
    @event = event
    mail(to: @event.email, subject: 'Se ha enviado un correo desde una tarea de Moodle.')
  end


end
