class Track 
  attr_reader :starts_at, :finishs_at, :lunch_at, :after_event_at, :talks, :tracks
  
  def initialize(options)
    options.each { |option, value| instance_variable_set("@#{option}", value) }
    @talks = options[:talks].clone
    @tracks = []
    normalize
  end

  def start
    @talks.shuffle!
    
    @tracks |= process(@starts_at, @lunch_at)
    @tracks << Talk.new(title: "Lunch", starts_at: @lunch_at)
    @tracks |= process(@lunch_at + 1.hour, @finishs_at)
    @tracks << Talk.new(title: "Networking Event", starts_at: @after_event_at)
    
    @tracks
  end

  def to_s
    start if @tracks.nil?
    result = []
    @tracks.map(&:"to_s").join("\n")
  end

  private

  def normalize
    @starts_at = Time.parse(@starts_at)
    @finishs_at = Time.parse(@finishs_at)
    @lunch_at = Time.parse(@lunch_at)
    @after_event_at = Time.parse(@after_event_at)
  end

  def process(from, to)
    result_talks, current_length = [], 0
    length = to - from
    @talks.each do |talk|
      if current_length < length && current_length + talk.length <= length
        talk.starts_at = from + current_length
        result_talks << @talks.delete(talk)
        current_length += talk.length
      end
    end
    result_talks
  end
end