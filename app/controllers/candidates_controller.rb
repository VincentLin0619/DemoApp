class CandidatesController < ApplicationController
  before_action :find_params_id, only: %i[show edit update]
  # before_action :errors, only: [:create, :update]

  def index
    @candidates = Candidate.all
    @path = controller_path
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      redirect_to candidates_path, notice: 'Candidate created successfully!!!'
    else
      render :new
      flash[:alert] = errors(@candidate)
    end
  end

  def show; end

  def edit; end

  def update
    if @candidate.update(candidate_params)
      redirect_to candidates_path, notice: 'Candidate updated successfully!!!'
    else
      render :edit
      flash[:alert] = errors(@candidate)
    end
  end

  private

  def candidate_params
    params.require(:candidate).permit(:name, :party, :age, :politics)
  end

  def find_params_id
    @candidate = Candidate.find(params[:id])
  end

  def errors(obj)
    obj.errors.full_messages if obj.errors.any?
  end
end
