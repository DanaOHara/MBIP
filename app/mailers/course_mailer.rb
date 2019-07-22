class CourseMailer < ApplicationMailer

  def course_register_email
    mail = params[:email]
    @professor = params[:professor]
    @alumn = params[:alumn]
    @course = params[:course]
    mail(to: mail, subject: 'Se ha solicitado la inscripción de un alumno.')
  end
end
