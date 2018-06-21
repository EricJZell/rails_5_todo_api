class ItemsController < ApplicationController
  before_action :set_todo
  before_action :set_item, only: [:show, :update, :destroy]

  # GET /todos/:todo_id/items
  def index
    render(json: @todo.items, status: :ok)
  end

  # POST /todos/:todo_id/items
  def create
    @todo.items.create!(item_params)
    render(json: @todo, status: :created)
  end

  # GET /todos/:todo_id/items/:id
  def show
    render(json: @item, status: :ok)
  end

  # PUT /todos/:todo_id/items/:id
  def update
    @item.update(item_params)
    head :no_content
  end

  # DELETE /todos/:todo_id/items/:id
  def destroy
    @item.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:name, :done)
  end

  def set_todo
    @todo = Todo.find(params[:todo_id])
  end

  def set_item
    @item = @todo.items.find(params[:id]) if @todo
  end
end
