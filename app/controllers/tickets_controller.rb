class TicketsController < ApplicationController
  before_action :authenticate_customer!


  def summary
    tickets = current_customer.admin? ? Ticket.all : current_customer.tickets

    @totalTickets  = tickets.count
    @openedTickets = tickets.where(status: "Open").count
    @closedTickets = tickets.where(status: "Closed").count
    @inProgressTickets = tickets.where(status: "In-Progress").count
  end

  def index
    if current_customer.admin?
      @tickets = Ticket.all
    else
      @tickets = current_customer.tickets
    end

    if params[:search].present?
      query = "%#{params[:search]}%"

      @tickets = @tickets.where(
        "title LIKE :query OR status LIKE :query OR priority LIKE :query OR id LIKE :query OR ticket_number LIKE :query" ,
        query: query
      )
    end
  end

  def new
    @ticket = Ticket.new
  end

def create
  @ticket = Ticket.new(ticket_params)
  @ticket.customer_id = current_customer.id
  @ticket.status = "Open"
  @ticket.priority = "Low"

  if @ticket.save
    redirect_to tickets_path, notice: "Ticket created successfully"
  else
    flash.now[:alert] = "Error creating ticket"
    render :new, status: :unprocessable_entity
  end
end

  def show
      @ticket = Ticket.find(params[:id])
      @comment = Comment.new
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])

    if @ticket.update(ticket_params)
      redirect_to tickets_path, notice: "ticket updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    if @ticket.destroy
      redirect_to tickets_path , notice: "ticket successfully deleted"
    end
  end


private
 def ticket_params
   params.require(:ticket).permit(:title, :description, :priority, :status, images: [])
 end
end
