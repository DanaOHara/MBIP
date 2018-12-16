class MdlFilesController < ApplicationController
  before_action :set_mdl_file, only: [:show, :edit, :update, :destroy]

  # GET /mdl_files
  # GET /mdl_files.json
  def index
    @mdl_files = MdlFile.all
  end

  # GET /mdl_files/1
  # GET /mdl_files/1.json
  def show
  end

  # GET /mdl_files/new
  def new
    @mdl_file = MdlFile.new
  end

  # GET /mdl_files/1/edit
  def edit
  end



def descarga


end
  # POST /mdl_files
  # POST /mdl_files.json
  def create
    @mdl_file = MdlFile.new(mdl_file_params)

    respond_to do |format|
      if @mdl_file.save
        format.html { redirect_to @mdl_file, notice: 'Mdl file was successfully created.' }
        format.json { render :show, status: :created, location: @mdl_file }
      else
        format.html { render :new }
        format.json { render json: @mdl_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mdl_files/1
  # PATCH/PUT /mdl_files/1.json
  def update
    respond_to do |format|
      if @mdl_file.update(mdl_file_params)
        format.html { redirect_to @mdl_file, notice: 'Mdl file was successfully updated.' }
        format.json { render :show, status: :ok, location: @mdl_file }
      else
        format.html { render :edit }
        format.json { render json: @mdl_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mdl_files/1
  # DELETE /mdl_files/1.json
  def destroy
    @mdl_file.destroy
    respond_to do |format|
      format.html { redirect_to mdl_files_url, notice: 'Mdl file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mdl_file
      @mdl_file = MdlFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mdl_file_params
      params.require(:mdl_file).permit(:contenthash, :pathnamehash, :contextid, :component, :filearea, :itemid, :filepath, :filename, :userid, :filesize, :mimetype, :status, :source, :author, :license, :timecreated, :timemodified, :sortorder, :referencefileid)
    end
end
