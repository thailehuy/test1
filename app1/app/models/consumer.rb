class Consumer
  def self.consume_seeder
    if seeder = Seeder.not_consumed.order('RANDOM()').first
      seeder.consume!
    end
  end
end