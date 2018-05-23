class Seeder < ApplicationRecord
  scope :not_consumed, -> { where(consumed: false) }

  class << self
    def generate_seed
      last_seed = Seeder.order(created_at: :desc).first
      if !last_seed || last_seed.created_at < Time.now - 5.minutes
        Seeder.create(seed: seed_string)
      end
    end

    def seed_string
      "#{ENV['APP_NUM']}-#{SecureRandom.hex(6)}"
    end
  end

  def consume!
    update_attributes(consumed: true)
  end
end
