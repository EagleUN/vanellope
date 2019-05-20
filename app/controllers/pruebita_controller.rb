class PruebitaController < ApplicationController
  before_action :set_pruebitum, only: [:show, :edit, :update, :destroy]

  # GET /pruebita
  # GET /pruebita.json
  def index
    @pruebita = Pruebitum.all
  end

  # GET /pruebita/1
  # GET /pruebita/1.json
  def show
  end

  # GET /pruebita/new
  def new
    @pruebitum = Pruebitum.new
  end

  # GET /pruebita/1/edit
  def edit
  end

  # POST /pruebita
  # POST /pruebita.json
  def create
    @pruebitum = Pruebitum.new(pruebitum_params)

    respond_to do |format|
      if @pruebitum.save
        format.html { redirect_to @pruebitum, notice: 'Pruebitum was successfully created.' }
        format.json { render :show, status: :created, location: @pruebitum }
      else
        format.html { render :new }
        format.json { render json: @pruebitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pruebita/1
  # PATCH/PUT /pruebita/1.json
  def update
    respond_to do |format|
      if @pruebitum.update(pruebitum_params)
        format.html { redirect_to @pruebitum, notice: 'Pruebitum was successfully updated.' }
        format.json { render :show, status: :ok, location: @pruebitum }
      else
        format.html { render :edit }
        format.json { render json: @pruebitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pruebita/1
  # DELETE /pruebita/1.json
  def destroy
    @pruebitum.destroy
    respond_to do |format|
      format.html { redirect_to pruebita_url, notice: 'Pruebitum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pruebitum
      @pruebitum = Pruebitum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pruebitum_params
      params.require(:pruebitum).permit(:info, :name, :age, :salary)
    end
end
