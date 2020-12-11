class TicketsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_show, only: [:book, :create]

  def index
    @tickets = current_user.tickets
  end

  def book
    @ticket = Ticket.new
  end

  def create
    if params[:ticket].blank? || params[:ticket][:seats].blank?
      @ticket = Ticket.new
      flash[:warning] = "Please provide seats"
      render 'book' and return
    end
    if current_user
      @ticket = current_user.tickets.create(show: @show, seats: params[:ticket][:seats])
      redirect_to ticket_shows_path(id: @ticket.id)
    else
      if !params[:user][:email].blank? && fetch_user
        @user.tickets.create(show: @show, seats: params[:ticket][:seats])
        redirect_to ticket_shows_path(id: @ticket.id)
      else
        flash[:warning] = "Email not match to any user"
        render 'book' and return
      end
    end
  end

  def receipt
    @ticket = Ticket.find_by(id: params[:id])
  end
  private

  def set_show
    @show = Show.includes(:tickets).find(params[:id])
  end

  def fetch_user
    @user = User.find_by(email: params[:user][:email])
  end
end
