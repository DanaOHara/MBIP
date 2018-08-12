class UsersController < ApplicationController

  require 'shellwords'
  require 'open3'

  before_action :set_user, only: [:show, :edit, :update, :destroy, :vemail]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end
#####################################################################
  def emailErroneo

  end


  def vEmail
  end

 def email

   @mail = "@usach.cl"
   @user = User.select(:id).where("email = ?", params[:email] + @mail)



    if @user.nil? == true || @user.blank? == true

    render :action =>"emailErroneo"

   else
   # Por ahora la verificacion de la contrasena quedara en suspenso, con un email valido ira a los cursos del alumno

 cookies[:userMail] = {
 value:  params[:email] + @mail,
 expires: 1.hour,
 domain: :all
}

  redirect_to action: "vContrasena", email: " "
   #@mdl_id = MdlUser.select(:id).where("email = ?", params[:email].concat("@usach.cl"))
   #render json: @user
   #redirect_to  controller: 'users', action: 'vContrasena', :id => @user.pluck(:id)
   #redirect_to url_for(:controller => 'mdl_contexts', :action => 'cursos')

    #return @mdl_id
  end
end

def contrasena


  @user = User.select(:id, :password).where("email = ?", cookies[:userMail])

  path = File.dirname("/home/dana/MABIP/password.php") + '/'
  args = [ params[:contrasena], @user.pluck(:password).flatten.join(' ')]
  #@true  =  puts `php -e #{ path +  "password.php"} #{ Shellwords.join(args) } `
  @output, status = Open3.capture2('php', '-e', '/home/dana/MABIP/password.php', params[:contrasena], @user.pluck(:password).flatten.join(' '))
 #return render json: @output
  if @output == "0"

render :action =>"contrasenaErronea"

  else
    #el siguiente codigo es para grabr el id de usuario en la cookie, DEBE sermovido a la verificación de contraseña cuando esta se peuda hacer de buena manera
     cookies[:userid] = {
       value: @user.pluck(:id),
       expires: 1.hour,
       domain: :all
     }
    redirect_to :controller => 'contexts', :action => 'course', :id => @user.pluck(:id)
  end
end

def vContrasena

end

def contrasenaErronea

end


##################################################################

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:auth, :confirmed, :policyagreed, :deleted, :suspended, :mnethostid, :username, :password, :idnumber, :firstname, :lastname, :email, :emailstop, :icq, :skype, :yahoo, :aim, :msn, :phone1, :phone2, :institution, :department, :address, :city, :country, :lang, :calendartype, :theme, :timezone, :firstaccess, :lastaccess, :lastlogin, :currentlogin, :lastip, :secret, :picture, :url, :description, :descriptionformat, :mailformat, :maildigest, :maildisplay, :autosubscribe, :trackforums, :timecreated, :timemodified, :trustbitmask, :imagealt, :lastnamephonetic, :firstnamephonetic, :middlename, :alternatename)
    end
end
