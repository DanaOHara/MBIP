class EventMailer < ApplicationMailer

  def assignment_email()
    @message = 'Hola a todos'
    mail(to:'rosa.munozv@usach.cl', subject: 'Se ha enviado un correo desde una tarea de Moodle.')
  end
end
