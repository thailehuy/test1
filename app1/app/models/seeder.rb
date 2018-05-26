class Seeder < ApplicationRecord
  scope :not_consumed, -> { where(consumed: false) }
  scope :current_app, -> { where(source: ENV['APP_NUM']) }

  class << self
    def generate_seed
      Seeder.create(seed: seed_string, source: ENV['APP_NUM'])
    end

    def seed_string
      "#{ENV['APP_NUM']}-#{SecureRandom.hex(6)}"
    end
  end

  def consume!
    update_attributes(consumed: true)
  end
end
