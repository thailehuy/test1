class ReportsController < ActionController::API
  def show
    @seeders = Seeder.order(created_at: :desc).limit(10)
    render json: @seeders
  end
end
