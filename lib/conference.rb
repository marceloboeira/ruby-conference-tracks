require 'time'
require 'active_support/time'
require_relative 'talk'
require_relative 'track'

class Conference
  
  def initialize(options = {})
    options.each { |option, value| instance_variable_set("@#{option}", value) }
  
    @input ||= ""
    @talks = []

    parse_input
  end

  def start
    @track = Track.new(starts_at: @starts_at, 
                       finishs_at: @finishs_at,
                       launch_at: @launch_at,
                       after_event_at: @after_event_at,
                       talks: @talks.clone)
    @track.start
  end

  def to_s
    start if @track.nil?
    @track.to_s
  end

  private
  
  def parse_input
    @input.lines.map(&:chomp).each do |line|
      talk = Talk.parse(line) 
      @talks << talk unless talk.nil?
    end
  end
  
end
