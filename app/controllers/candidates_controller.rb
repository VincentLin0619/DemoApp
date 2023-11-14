class CandidatesController < ApplicationController

  before_action :find_params_id, only: [:show, :edit, :update]
  # before_action :errors, only: [:create, :update]

  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    save_and_redirect(@candidate, candidates_path, "Candidate created successfully!!!", :new)
  end

  def show
  end

  def edit
  end

  def update
    save_and_redirect(@candidate, candidates_path, "Candidate updated successfully!!!", :edit)
  end


  private

  def candidate_params
    params.require(:candidate).permit(:name, :party, :age, :politics)
  end

  def find_params_id
    @candidate = Candidate.find(params[:id])
  end

  # 成功跳轉與錯誤訊息
  def save_and_redirect(obj, path, msg, render)
    if obj.save
      redirect_to(path)
      flash[:notice] = msg
    else
      render(render)
      flash.now[:alert] = errors(obj)
    end
  end

  def errors(obj)
    obj.errors.full_messages if obj.errors.any?
  end

end
