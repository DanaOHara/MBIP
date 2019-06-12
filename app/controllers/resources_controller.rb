class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.all
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
  end

  # GET /resources/new
  def new
    @resource = Resource.new
  end

  # GET /resources/1/edit
  def edit
  end
##########################################################

def recursosPorCurso

  @resources = Resource.select(:name,:course, :id, :timemodified).where("course = ?", params[:course])

  if @resources.nil? == true || @resources.blank? == true

  redirect_to :action =>"sinRecursos", :course => params[:course]

  else

    cookies[:courseId] = {
    value: params[:course],
    expires: 1.hour,
    domain: :all
          }
  return @resources
  #render json: @resources
  end

end

def sinRecursos


end

def descarga

    render :action =>"descargaINT"

    @resources = Resource.select(:name,'file.contenthash', 'file.mimetype').joins("INNER JOIN files file ON file.timemodified = resource.timemodified").where("file.mimetype != 'NULL' AND resource.timemodified = ?", params[:timemodified])
    #render json:@resources
    send_file  '/opt/lampp/moodledata/filedir/' + @resources.first.contenthash[0..1] +  '/'+ @resources.first.contenthash[2..3]+'/'+@resources.first.contenthash+'', :type => @resources.first.mimetype, :filename => @resources.first.name
    #render :action => "descarga"
end

def descargaINT

end

##########################################################
  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(resource_params)

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(:course, :name, :intro, :introformat, :tobemigrated, :legacyfiles, :legacyfileslast, :display, :displayoptions, :filterfiles, :revision, :timemodified)
    end
end
