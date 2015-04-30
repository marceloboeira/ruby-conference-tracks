class Talk 
  attr_accessor :title, :length

  def initialize(options = {})
    title = options[:title] || "No name"
    length = options[:length] || "10min"
  end

  def length=(value)
    @length = value.delete('^0-9').to_i
  end

  # Default pattern: "Name of my conference 40min"
  def self.parse input
    title  = input.split(" ")
    length = title.pop
    Talk.new(title: title.join(" "), length: length)
  end
end