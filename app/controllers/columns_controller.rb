class ColumnsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_column, only: %i[ show ]
  before_action :set_board, only: %i[ create ]

  # GET /columns or /columns.json
  def index
    @columns = Column.all
  end

  # GET /columns/1 or /columns/1.json
  def show
  end

  # GET /columns/new
  def new
    @column = Column.new
  end

  # GET /columns/1/edit
  def edit
  end

  # POST /columns or /columns.json
  def create
    @column = Column.new(column_params)
    @column.board = @board

    @column.save
  end

  # PATCH/PUT /columns/1 or /columns/1.json
  def update
    if column_params[:tasks_attributes][:change_only_column]
      task = Task.find(column_params[:tasks_attributes][:id])

      task = task.update(column: @column)
    else
      column_updated = @column.update(column_params)
    end

    unless task
      respond_to do |format|
        if column_updated
          format.html { redirect_to board_url(@column.board), notice: "Column was successfully updated." }
          format.json { render :show, status: :ok, location: @column.board }
        else
          format.html { redirect_to board_url(@column.board), notice: "Some error occurred when updating the column." }
          format.json { render json: @column.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /columns/1 or /columns/1.json
  def destroy
    @column.destroy

    respond_to do |format|
      format.html { redirect_to columns_url, notice: "Column was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_column
      @column = Column.find(params[:id])
    end

    def set_board
      @board = Board.find(params[:board_id])
    end

    # Only allow a list of trusted parameters through.
    def column_params
      params.fetch(:column, {}).permit(
        :name
      )
    end
end