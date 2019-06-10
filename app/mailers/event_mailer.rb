class EventMailer < ApplicationMailer

  def assignment_email
    mail = params[:email]
    filename = params[:file_name]
    fileroute = params[:file_route]
    attachments[filename] = File.read(fileroute)
    mail(to: mail, subject: 'Se ha enviado un correo desde una tarea de Moodle.')
  end
end
