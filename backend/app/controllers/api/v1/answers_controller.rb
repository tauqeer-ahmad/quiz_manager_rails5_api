class Api::V1::AnswersController < Api::V1::BaseController
  before_action :set_question
  before_action :set_answer, only: %i[show update destroy]

  def index
    @answers = @question.answers

    render json: @answers
  end

  def show
    render json: @answer
  end

  def create
    answer = @question.answers.new(answer_params)
    answer.save

    render_response(answer)
  end

  def update
    @answer.update(answer_params)
    render_response(@answer)
  end

  def destroy
    @question.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:question_id])
    end

    def set_answer
      @answer = @question.answers.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def answer_params
      params.require(:answer).permit(:content)
    end
end
