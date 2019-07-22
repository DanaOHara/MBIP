class EventMailer < ApplicationMailer

  def assignment_email
    mail = params[:email]
    filename = params[:file_name]
    fileroute = params[:file_route]
    attachments[filename] = File.read(fileroute)
    mail(to: mail, subject: 'Se ha enviado un correo desde una tarea de Moodle.')
  end

  def course_register_email
    mail(to: mail, subject: 'Se ha solicitado la inscripción de un alumno.')
  end

end
