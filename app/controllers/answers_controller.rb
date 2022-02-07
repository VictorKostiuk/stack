class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    # respond_to do |format|
    #   if @answer.save
    #     # format.html { redirect_to @question, notice: 'Answer was successfully created.' }
    #     format.js
    #   else
    #     format.js { render json: @answer.errors, status: :unprocessable_entity }
    #     end
    #   end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
