module Admin
  class RatesController < Admin::ApplicationController
    before_action :set_rate, only: %i[show edit update destroy]
    before_action :pundit_authorize

    # GET /rates
    # GET /rates.json
    def index
      @rates = Rate.all.order(person_type: :asc, smoking: :desc, min_age: :asc)
    end

    # GET /rates/1
    def show; end

    # GET /rates/new
    def new
      @rate = Rate.new
    end

    # GET /rates/1/edit
    def edit; end

    # POST /rates
    def create
      @rate = Rate.new(rate_params)

      if @rate.save
        redirect_to [:admin, @rate], notice: 'Rate was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /rates/1
    def update
      if @rate.update(rate_params)
        redirect_to [:admin, @rate], notice: 'Rate was successfully updated.'
      else
        render :edit
      end
    end

    def multiple_edit
      @age_ranges = Rate.all_age_ranges
      @smoking_employees_rates = Rate.employees.smoking.ordered_by_age
      @non_smoking_employees_rates = Rate.employees.non_smoking.ordered_by_age
      @smoking_spouses_rates = Rate.spouses.smoking.ordered_by_age
      @non_smoking_spouses_rates = Rate.spouses.non_smoking.ordered_by_age
    end

    def multiple_update
      data_is_valid = true
      params[:rates].each do |id, value|
        rate = Rate.find(id.to_i)
        rate.percentage = value[:percentage]
        unless rate.valid?
          data_is_valid = false
          break
        end
      end

      if data_is_valid
        params[:rates].each do |id, value|
          Rate.update(id.to_i, percentage: value[:percentage])
        end
        flash[:notice] = 'Updates were successful.'
      else
        flash[:error] = 'Row not updated. Invalid data found.'
      end

      redirect_to %i[multiple_edit admin rates]
    end

    # DELETE /rates/1
    def destroy
      @rate.destroy

      redirect_to admin_rates_url, notice: 'Rate was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_rate
      @rate = Rate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list
    # through.
    def rate_params
      params.require(:rate)
            .permit(:min_age, :max_age, :percentage, :person_type, :smoking)
    end

    def pundit_authorize
      authorize(@rate || Rate)
    end
  end
end
