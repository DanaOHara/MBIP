class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  ##########################################################

  def eventosPorCurso

      @events = Event.select(:id, :name, :courseid).where("courseid = ?", params[:courseid])

      if @events.nil? == true || @events.blank? == true

      redirect_to :action =>"sinEventos", :courseid => params[:courseid]

      else

    return @events

    #  render json: @events

      end
    end


    def sinEventos

      render :action =>"sinEventos"

    end

    def eventosDetalle

      #@events = Event.select(:name, :description, :timestart, :timemodified, :id).where('id = ?', params[:eventid])
      @events = Event.select(:name, :description, :timestart, :timemodified, :id,:courseid,'usr.email').joins(" INNER JOIN user usr ON event.userid = usr.id"). where("event.id = ? ", params[:eventid])

      if Time.at(@events.first.timestart).to_datetime < Date.today

        render :action =>"eventoCaduco"

      else
        cookies[:eventId] = {
          value: @events.pluck(:id),
          expires: 10.minutes,
        }
      return @events
      #render json: @events
      end

    end

  #  def emailProf
      #  @context = Context.select(:fullname,'co.id').joins(" INNER JOIN role_assignments  ra ON  ra.contextid =  context.id INNER JOIN course co ON co.id = context.instanceid" ).where("ra.userid = ? ", params[:id])

  #    @mail = Event.select('usr.email').joins(" INNER JOIN user usr ON event.userid = usr.id"). where("event.id = ? ", params[:id])

  #    render json: @mail


  #  end



    def eventoCaduco

    end

    def enviarCorreo
      #name = params[:name]
      email = params[:event][:email]
      #body = params[:body]
      EventMailer.assignment_email(email).deliver_now!

      #render json: params[:event][:courseid]

     redirect_to :action => "envioExitoso", :courseid => params[:event][:courseid]
    end

    def envioExitoso



    end

    def upload
      f = params[:file] # Take the files which are sent by HTTP POST request.
      event_id = cookies[:eventId].to_s
      user_id = cookies[:userid].to_s
      course_id = cookies[:courseId].to_s
      timestamp = DateTime.now.to_time.to_i.to_s
      file_route = Rails.root.join('public', 'uploads', course_id, event_id, user_id, timestamp, f.original_filename)
      #time_footprint = Time.now.to_i.to_formatted_s(:number) # Generate a unique number to rename the files to prevent duplication
        # these two following comments are some useful methods to debug
        # abort f.class.inspect -> It is similar to var_dump($variable) in PHP.
        # abort f.is_a?(Array).inspect -> With "is_a?" method, you can find the type of variable
        # abort f[1].original_filename.inspect
        # The following snippet saves the uploaded content in '#{Rails.root}/public/uploads' with a name which contains a time footprint + the original file
        # reference: http://guides.rubyonrails.org/form_helpers.html
        dirname = File.dirname(file_route)
        unless File.directory?(dirname)
          FileUtils.mkdir_p(dirname)
        end
        File.open(file_route, 'wb') do |file|
          file.write(f.read)
          #File.rename(file, 'public/uploads/' + time_footprin + f[1].original_filename)
          File.rename(file, file_route)
        end
      files_list = Dir[dirname + '/*'].to_json #get a list of all files in the {public/uploads} directory and make a JSON to pass to the server
      render json: { message: 'You have successfully uploded your images.', files_list: files_list } #return a JSON object amd success message if uploading is successful
    end


  ##########################################################



  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :description, :format, :courseid, :groupid, :userid, :repeatid, :modulename, :instance, :eventtype, :timestart, :timeduration, :visible, :uuid, :sequence, :timemodified, :subscriptionid)
    end
end
