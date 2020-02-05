class BolgsController < ApplicationController
  before_action :set_bolg, only: [:show, :edit, :update, :destroy]

  # GET /bolgs
  # GET /bolgs.json
  def index
    @bolgs = Bolg.all
  end

  # GET /bolgs/1
  # GET /bolgs/1.json
  def show
  end

  # GET /bolgs/new
  def new
    @bolg = Bolg.new
  end

  # GET /bolgs/1/edit
  def edit
  end

  # POST /bolgs
  # POST /bolgs.json
  def create
    @bolg = Bolg.new(bolg_params)

    respond_to do |format|
      if @bolg.save
        format.html { redirect_to @bolg, notice: 'Bolg was successfully created.' }
        format.json { render :show, status: :created, location: @bolg }
      else
        format.html { render :new }
        format.json { render json: @bolg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bolgs/1
  # PATCH/PUT /bolgs/1.json
  def update
    respond_to do |format|
      if @bolg.update(bolg_params)
        format.html { redirect_to @bolg, notice: 'Bolg was successfully updated.' }
        format.json { render :show, status: :ok, location: @bolg }
      else
        format.html { render :edit }
        format.json { render json: @bolg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bolgs/1
  # DELETE /bolgs/1.json
  def destroy
    @bolg.destroy
    respond_to do |format|
      format.html { redirect_to bolgs_url, notice: 'Bolg was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bolg
      @bolg = Bolg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bolg_params
      params.require(:bolg).permit(:title, :body)
    end
end
