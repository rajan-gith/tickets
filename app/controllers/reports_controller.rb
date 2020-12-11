class ReportsController < ApplicationController

  def index
    @shows = Show.all
  end

  def show
    @show = Show.includes(:tickets).find_by(id: params[:id])
    respond_to do |format|
      format.html
      format.csv  {
        send_data generate_csv, filename: "cars-#{Date.today}.csv"
      }
    end
  end

  private
  def generate_csv
    attributes = %w{no. user_email seats charges}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      @show.tickets.each do |ticket|
        csv << [ticket.id, ticket.user.email, ticket.seats.join(", "), ticket.amount]
      end
    end
  end
end
