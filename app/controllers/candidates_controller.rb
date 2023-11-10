class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      flash[:notice] = "Candidate created successfully!!!"
      redirect_to candidates_path
    else
      error = @candidate.errors.full_messages
      flash.now[:alert] = error
      render :new
    end
  end

  def show
    @candidate = Candidate.find(params[:id])
  end

  private

  def candidate_params
    params.require(:candidate).permit(:name, :party, :age, :politics)
  end

end
