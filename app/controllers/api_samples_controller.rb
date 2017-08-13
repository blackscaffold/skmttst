class ApiSamplesController < ApplicationController
  before_action :set_api_sample, only: [:show, :edit, :update, :destroy]

  # GET /api_samples
  # GET /api_samples.json
  def index
    @api_samples = ApiSample.all
  end

  # GET /api_samples/1
  # GET /api_samples/1.json
  def show
  end

  # GET /api_samples/new
  def new
    @api_sample = ApiSample.new
  end

  # GET /api_samples/1/edit
  def edit
  end

  # POST /api_samples
  # POST /api_samples.json
  def create
    @api_sample = ApiSample.new(api_sample_params)



    respond_to do |format|
      res = HTTParty.get('http://zip.cgis.biz/csv/zip.php?zn=' + @api_sample.uri) if @api_sample.valid?
      @api_sample.body = res.body if res.code == 200

      if @api_sample.save
        format.html { redirect_to @api_sample, notice: 'Api sample was successfully created.' }
        format.json { render :show, status: :created, location: @api_sample }
      else
        format.html { render :new }
        format.json { render json: @api_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api_samples/1
  # PATCH/PUT /api_samples/1.json
  def update
    respond_to do |format|
      if @api_sample.update(api_sample_params)
        format.html { redirect_to @api_sample, notice: 'Api sample was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_sample }
      else
        format.html { render :edit }
        format.json { render json: @api_sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api_samples/1
  # DELETE /api_samples/1.json
  def destroy
    @api_sample.destroy
    respond_to do |format|
      format.html { redirect_to api_samples_url, notice: 'Api sample was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_sample
      @api_sample = ApiSample.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_sample_params
      params.require(:api_sample).permit(:uri, :body)
    end
end
