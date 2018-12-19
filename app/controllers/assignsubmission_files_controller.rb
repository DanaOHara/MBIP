class AssignsubmissionFilesController < ApplicationController
  before_action :set_assignsubmission_file, only: [:show, :edit, :update, :destroy]

  # GET /assignsubmission_files
  # GET /assignsubmission_files.json
  def index
    @assignsubmission_files = AssignsubmissionFile.all
  end

  # GET /assignsubmission_files/1
  # GET /assignsubmission_files/1.json
  def show
  end

  # GET /assignsubmission_files/new
  def new
    @assignsubmission_file = AssignsubmissionFile.new
  end

  # GET /assignsubmission_files/1/edit
  def edit
  end

  # POST /assignsubmission_files
  # POST /assignsubmission_files.json
  def create
    @assignsubmission_file = AssignsubmissionFile.new(assignsubmission_file_params)

    respond_to do |format|
      if @assignsubmission_file.save
        format.html { redirect_to @assignsubmission_file, notice: 'Assignsubmission file was successfully created.' }
        format.json { render :show, status: :created, location: @assignsubmission_file }
      else
        format.html { render :new }
        format.json { render json: @assignsubmission_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignsubmission_files/1
  # PATCH/PUT /assignsubmission_files/1.json
  def update
    respond_to do |format|
      if @assignsubmission_file.update(assignsubmission_file_params)
        format.html { redirect_to @assignsubmission_file, notice: 'Assignsubmission file was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignsubmission_file }
      else
        format.html { render :edit }
        format.json { render json: @assignsubmission_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignsubmission_files/1
  # DELETE /assignsubmission_files/1.json
  def destroy
    @assignsubmission_file.destroy
    respond_to do |format|
      format.html { redirect_to assignsubmission_files_url, notice: 'Assignsubmission file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignsubmission_file
      @assignsubmission_file = AssignsubmissionFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignsubmission_file_params
      params.require(:assignsubmission_file).permit(:assignment, :submission, :numfiles)
    end
end
