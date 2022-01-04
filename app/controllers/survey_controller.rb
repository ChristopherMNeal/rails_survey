class AlbumsController < ApplicationController
    
  def index
    @surveys = Survey.all
    render :index
  end

  def new
    @survey = Survey.new
    render :new
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to surveys_path
    else 
      render :new
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to surveys_path
  end
 
  def edit
    @survey = Survey.find(params[:id])
    render :edit
  end

  def update
    @survey= Survey.find(params[:id])
    if @survey.update(survey_params)
      redirect_to surveys_path
    else
      render :edit
    end
  end

  def show
    @survey = Survey.find(params[:id])
    render :show
  end

  private
  def survey_params
    params.require(:survey).permit(:name)
  end
end