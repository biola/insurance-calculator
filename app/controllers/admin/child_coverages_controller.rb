class Admin::ChildCoveragesController < Admin::ApplicationController
  before_action :set_child_coverage, only: [:show, :edit, :update, :destroy]
  before_action :pundit_authorize

  # GET /child_coverages
  def index
    @child_coverages = ChildCoverage.all.ordered_asc
  end

  # GET /child_coverages/1
  def show
  end

  # GET /child_coverages/new
  def new
    @child_coverage = ChildCoverage.new
  end

  # GET /child_coverages/1/edit
  def edit
  end

  # POST /child_coverages
  def create
    @child_coverage = ChildCoverage.new(child_coverage_params)

      if @child_coverage.save
        redirect_to [:admin, @child_coverage], notice: 'Child coverage was successfully created.'
      else
        render :new
      end

  end

  # PATCH/PUT /child_coverages/1
  def update

      if @child_coverage.update(child_coverage_params)
        redirect_to [:admin, @child_coverage], notice: 'Child coverage was successfully updated.'
      else
        render :edit
      end

  end

  # DELETE /child_coverages/1
  def destroy
    @child_coverage.destroy
      redirect_to admin_child_coverages_url, notice: 'Child coverage was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child_coverage
      @child_coverage = ChildCoverage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def child_coverage_params
      params.require(:child_coverage).permit(:amount, :premium)
    end

    def pundit_authorize
      authorize (@child_coverage || ChildCoverage)
    end
end
