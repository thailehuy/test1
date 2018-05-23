class ReportsController < ApplicationController
  APP1_DATA_URL = 'https://secure-ravine-66887.herokuapp.com/report'
  APP2_DATA_URL = 'https://shrouded-shore-35002.herokuapp.com/report'

  def index
    data_url = case params[:num]
                 when '1'
                   APP1_DATA_URL
                 when '2'
                   APP2_DATA_URL
                 else
                   raise 'Not found'
               end

    response = RestClient.get(data_url, {accept: :json})
    @data = JSON.parse(response.body)
  end
end
