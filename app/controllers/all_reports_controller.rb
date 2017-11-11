class AllReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = AllReport.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @approval = ['Pending','Approved', 'Rejected']
    @report = AllReport.new
  end

  # GET /reports/1/edit
  def edit
    @approval = ['Pending','Approved', 'Rejected']
  end

  # POST /reports
  # POST /reports.json
  def create
    # binding.pry
    name = params[:all_report][:name]
    yrmnth = params[:all_report][:yrmnth]
    link = params[:all_report][:link]
    file = params[:all_report][:file]
    approval = params[:all_report][:approval]
    comment = params[:all_report][:comment]
    # binding.pry
    if !file.blank?
      # binding.pry
      orig = file.original_filename
      token = SecureRandom.hex(64)
      path = "#{Rails.root}/uploads/#{token}"
      FileUtils.cp file.path, path
      UploadImagesJob.perform_later(name, yrmnth, link, orig, token, path, file.content_type, approval, comment)
    else
      @report = AllReport.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
    end
    redirect_to all_reports_path
    return
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to all_reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = AllReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params[:all_report].permit(:name, :yrmnth,  :link, :approval, :comment)
     
    end
end