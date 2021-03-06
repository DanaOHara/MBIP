class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end
##############################################
def buscar



end

def cursos

@search = params[:fullname]

@course = Course.select( :id,:fullname).where("fullname like ?", "%#{@search}%")

if @course.nil? == true || @course.blank? == true

render :action =>"sinCursos"

else

return @course

  #render json: @course

end
end


def sinCursos



end

def addCourse
  @course = Course.select(:id, :fullname).where('id = ?', params[:id]).first
  @professor = User.select(:id, :firstname, :lastname, :email).joins('INNER JOIN role_assignments ra on user.id = ra.userid INNER JOIN context ctx on ra.contextid = ctx.id').where('ctx.contextlevel = 50 and ra.roleid = 3 and ctx.instanceid = ?', params[:id]).first
end

def registerCourse
  @course = Course.select(:id, :fullname).where('id = ?', params[:id]).first
  @alumn = User.select(:id, :firstname, :lastname, :email).find(cookies[:userid])
  @alumn_name = @alumn.firstname + ' ' + @alumn.lastname
  @professor = User.select(:id, :firstname, :lastname, :email).joins('INNER JOIN role_assignments ra on user.id = ra.userid INNER JOIN context ctx on ra.contextid = ctx.id').where('ctx.contextlevel = 50 and ra.roleid = 3 and ctx.instanceid = ?', params[:course_id]).first
  @professor_name = @professor.firstname + ' ' + @professor.lastname
  CourseMailer.with(email: @professor.email, alumn: @alumn_name, professor: @professor_name, course: @course.fullname).course_register_email.deliver_now!
end

##############################################

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:category, :sortorder, :fullname, :shortname, :idnumber, :summary, :summaryformat, :format, :showgrades, :newsitems, :startdate, :marker, :maxbytes, :legacyfiles, :showreports, :visible, :visibleold, :groupmode, :groupmodeforce, :defaultgroupingid, :lang, :calendartype, :theme, :timecreated, :timemodified, :requested, :enablecompletion, :completionnotify, :cacherev)
    end
end
