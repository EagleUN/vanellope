class FuncionarasController < ApplicationController
  before_action :set_funcionara, only: [:show, :edit, :update, :destroy]

  # GET /funcionaras
  # GET /funcionaras.json
  def index
    @funcionaras = Funcionara.all
  end

  # GET /funcionaras/1
  # GET /funcionaras/1.json
  def show
  end

  # GET /funcionaras/new
  def new
    @funcionara = Funcionara.new
  end

  # GET /funcionaras/1/edit
  def edit
  end

  # POST /funcionaras
  # POST /funcionaras.json
  def create
    @funcionara = Funcionara.new(funcionara_params)

    respond_to do |format|
      if @funcionara.save
        format.html { redirect_to @funcionara, notice: 'Funcionara was successfully created.' }
        format.json { render :show, status: :created, location: @funcionara }
      else
        format.html { render :new }
        format.json { render json: @funcionara.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcionaras/1
  # PATCH/PUT /funcionaras/1.json
  def update
    respond_to do |format|
      if @funcionara.update(funcionara_params)
        format.html { redirect_to @funcionara, notice: 'Funcionara was successfully updated.' }
        format.json { render :show, status: :ok, location: @funcionara }
      else
        format.html { render :edit }
        format.json { render json: @funcionara.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionaras/1
  # DELETE /funcionaras/1.json
  def destroy
    @funcionara.destroy
    respond_to do |format|
      format.html { redirect_to funcionaras_url, notice: 'Funcionara was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcionara
      @funcionara = Funcionara.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funcionara_params
      params.require(:funcionara).permit(:info, :name)
    end
end
