class Admin::CoveragesController < Admin::ApplicationController
  before_action :set_coverage, only: [:show, :edit, :update, :destroy]
  before_action :pundit_authorize

  # GET /coverages
  def index
    @coverages = Coverage.all.ordered_asc
  end

  # GET /coverages/1
  def show
  end

  # GET /coverages/new
  def new
    @coverage = Coverage.new
  end

  # GET /coverages/1/edit
  def edit
  end

  # POST /coverages
  def create
    @coverage = Coverage.new(coverage_params)

      if @coverage.save
        redirect_to [:admin, @coverage], notice: 'Coverage was successfully created.'
      else
        render :new
      end

  end

  # PATCH/PUT /coverages/1
  def update

      if @coverage.update(coverage_params)
        redirect_to [:admin, @coverage], notice: 'Coverage was successfully updated.'
      else
        render :edit
      end

  end

  # DELETE /coverages/1
  def destroy
    @coverage.destroy
    redirect_to admin_coverages_url, notice: 'Coverage was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coverage
      @coverage = Coverage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coverage_params
      params.require(:coverage).permit(:amount)
    end

    def pundit_authorize
      authorize (@coverage || Coverage)
    end
end
