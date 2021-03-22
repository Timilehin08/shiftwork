class ShiftsController < ApplicationController
  before_action :set_shift, only: %i[ show edit update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  # GET /shifts or /shifts.json
  def index
    @shifts = Shift.all.order("created_at DESC")
  end

  # GET /shifts/1 or /shifts/1.json
  def show
  end

  # GET /shifts/new
  def new
    @shift = Shift.new
  end

  # GET /shifts/1/edit
  def edit
  end

  # POST /shifts or /shifts.json
  def create
    @shift = Shift.new(shift_params)

    respond_to do |format|
      if @shift.save
        format.html { redirect_to @shift, notice: "Shift was successfully created." }
        format.json { render :show, status: :created, location: @shift }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shifts/1 or /shifts/1.json
  def update
    respond_to do |format|
      if @shift.update(shift_params)
        format.html { redirect_to @shift, notice: "Shift was successfully updated." }
        format.json { render :show, status: :ok, location: @shift }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1 or /shifts/1.json
  def destroy
    @shift.destroy
    respond_to do |format|
      format.html { redirect_to shifts_url, notice: "Shift was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # def render_not_found
  #   render :file => "#{RAILS_ROOT}/public/404.html",  :status => 404
  # end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find(params[:id])
      raise ActiveRecord::RecordNotFound unless @shift
    end
    def render_404
      render :file => "#{Rails.root}/public/404.html",  layout: false, status: :not_found
    end
    # Only allow a list of trusted parameters through.
    def shift_params
      params.require(:shift).permit(:shift_status, :role_name, :shift_start, :shift_end, :shift_pay)
    end
end
