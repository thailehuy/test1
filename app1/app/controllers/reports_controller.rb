class ReportsController < ActionController::API
  def show
    @seeders = Seeder.current_app.order(created_at: :desc).limit(10)
    render json: @seeders
  end
end
