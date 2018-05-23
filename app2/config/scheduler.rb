require File.expand_path('../boot',        __FILE__)
require File.expand_path('../environment', __FILE__)
require 'clockwork'

module Clockwork
  every(ENV['APP_SEEDER_TIME'].to_i.minutes, 'generate.seed') do
    Seeder.generate_seed
  end
  every(ENV['APP_CONSUMER_TIME'].to_i.minutes, 'consume.seed') do
    Consumer.consume_seeder
  end
end