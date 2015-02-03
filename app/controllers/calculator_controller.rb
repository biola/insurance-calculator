class CalculatorController < ApplicationController
  def index
    @coverages = Coverage.all.ordered_asc
    @person_types = { Employee: "Employee", Spouse: "Spouse", Child: "Child"}
    @age_ranges = Rate.all_age_ranges
    @result = calculate if params[:coverage] && params[:person_type] && 
                           params[:age_range] && params[:smoking]
    @child_coverages = ChildCoverage.all.ordered_asc
  end

  private

  def calculate
    if ( params[:age_range].blank? || params[:person_type].blank? ||
         params[:smoking].blank? || params[:coverage].blank? )
      flash[:notice] = "Please make your selections before submitting."
      redirect_to '/calculator'
    else
      age_range = params[:age_range].split('-')
      rate = Rate.where(person_type: params[:person_type], 
                        min_age: age_range[0],
                        max_age: age_range[1],
                        smoking: params[:smoking] == 'true').first
      percentage = rate.percentage    
      (( params[:coverage].to_f / 10000 ) * percentage / 2 ).round(2)
    end
  end
end