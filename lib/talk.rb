class Talk 
  attr_reader :title, :length
  attr_accessor :starts_at

  def initialize(options = {})
    options.each { |option, value| instance_variable_set("@#{option}", value) }
    normalize
  end

  def to_s
    "#{@starts_at.strftime('%l:%M %p')} - #{@title}"
  end

  private

  def normalize
    @title ||= "No name"
    @length ||= "10min"
    @starts_at ||= "12:00 AM"
    @starts_at = Time.parse(@starts_at) if @starts_at.is_a? String
    @length = (@length == "lightning" ? 5 : @length.delete("^0-9").to_i) * 60
  end
 
  # Valid patterns:
  # "Name of my talk 40min"
  # "Name of my talk (40min)"
  # "Name of my talk - 40min"
  def self.parse(input)
    line = input.split(" ")
    Talk.new(length: line.pop, title: line.join(" "))
  end
end