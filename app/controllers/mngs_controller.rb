class MngsController < ApplicationController
  before_action :set_mng, only: [:show, :edit, :update, :destroy]

  def list
    @mngs = Mng.all
  end

  # GET /mngs
  # GET /mngs.json
  def index
    if Mng.count(:all) > 0
      @mng = Mng.where( 'id >= ?', rand(Mng.first.id..Mng.last.id) ).first
    else
      @nng = nil
    end
  end

  # GET /mngs/1
  # GET /mngs/1.json
  def show
  end

  # GET /mngs/new
  def new
    @mng = Mng.new
  end

  # GET /mngs/1/edit
  def edit
  end

  # POST /mngs
  # POST /mngs.json
  def create
    @mng = Mng.new(mng_params)
    @mng.yes = 0
    @mng.no = 0

    respond_to do |format|
      if @mng.save
        format.html { redirect_to @mng, notice: '質問を登録しました。このURLを記録してください。' }
        format.json { render :show, status: :created, location: @mng }
      else
        format.html { render :new }
        format.json { render json: @mng.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mngs/1
  # PATCH/PUT /mngs/1.json
  def update
    respond_to do |format|
      result = params[:result]
      mng_data = Mng.find(params[:id])

      yes = mng_data.yes
      no = mng_data.no

      if result == "1"
        logger.debug("yes")
        yes += 1
      else
        logger.debug("no")
        no += 1
      end

      if mng_data.update(yes: yes, no: no)
        format.html { redirect_to "/", notice: '回答ありがとう！' }
        format.json { render :show, status: :ok, location: @mng }
      else
        format.html { render :edit }
        format.json { render json: @mng.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mngs/1
  # DELETE /mngs/1.json
  def destroy
    id = @mng.id.to_s()
    @mng.destroy
    respond_to do |format|
      format.html { redirect_to "/list", notice: id + '削除しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mng
      @mng = Mng.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mng_params
      params.require(:mng).permit(:question, :yes, :no)
    end
end
