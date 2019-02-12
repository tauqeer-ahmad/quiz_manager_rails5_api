class Api::V1::QuestionsController < Api::V1::BaseController
  before_action :set_question, only: %i[show update destroy]

  def index
    @questions = Question.all

    render json: @questions
  end

  def show
    render json: @question
  end

  def create
    question = Question.new(question_params)
    question.save

    render_response(question)
  end

  def update
    @question.update(question_params)
    render_response(@question)
  end

  def destroy
    @question.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question).permit(:content)
    end
end
