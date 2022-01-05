class QuestionsController < ApplicationController
    
  def new
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.new
    render :new
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.new(question_params)
    if @question.save
      flash[:notice] = "Question successfully added!"
      redirect_to survey_path(@survey)
    else 
      flash[:alert] = "There was an error in updating your question!"
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to survey_path(@question.survey)
  end
 
  def edit
    @survey = Survey.find(params[:survey_id])
    @question = Question.find(params[:id])
    render :edit
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Question successfully updated!"
      redirect_to survey_path(@question.survey)
    else
      @survey = Survey.find(params[:survey_id])
      flash[:alert] = "There was an error in updating your question!"
      render :edit
    end
  end

  def show
    @survey = Survey.find(params[:survey_id])
    @question = Question.find(params[:id])
    render :show
  end

  private
  def question_params
    params.require(:question).permit(:content)
  end
end