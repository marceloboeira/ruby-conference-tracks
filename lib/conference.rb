require 'time'
require 'rubygems'
require 'active_support/time'

class Conference
  attr_accessor :from, :to, :launch

  def initialize(options = {})
    options.each { |option, value| instance_variable_set("@#{option}", value)

    self.from ||= "09:00 AM"
    self.to ||= "05:00 PM"
    self.launch ||= "12:00 AM"
    self.input ||= ""
  end

  def start
    @talks = [ 
      { name: "Writing Fast Tests Against Enterprise Rails", length: 60 },
      { name: "Overdoing it in Python", length: 45 },
      { name: "Lua for the Masses", length: 30 },
      { name: "Ruby Errors from Mismatched Gem Versions", length: 45 },
      { name: "Common Ruby Errors", length: 45 },
      #{ name: "Rails for Python Developers", length: 'lighthing' },
      { name: "Communicating Over Distance", length: 60 },
      { name: "Accounting-Driven Development", length: 45 },
      { name: "Woah", length: 30 },
      { name: "Sit Down and Write", length: 30 },
      { name: "Pair Programming vs Noise", length: 45 },
      { name: "Rails Magic", length: 60 },
      { name: "Ruby on Rails: Why We Should Move On", length: 60 },
      { name: "Clojure Ate Scala (on my project)", length: 45 },
      { name: "Programming in the Boondocks of Seattle", length: 30 },
      { name: "Ruby vs. Clojure for Back-End Development", length: 30 },
      { name: "Ruby on Rails Legacy App Maintenance", length: 60 },
      { name: "A World Without HackerNews", length: 30 },
      { name: "User Interface CSS in Rails Apps", length: 30 },
    ] 
    t = Time.parse("09 AM")
    track(180).each do |talk|
      
      p "#{t.strftime('%l:%M %p')} - #{talk[:name]}"
      t += (talk[:length] * 60)
    end
    p  "#{t.strftime('%l:%M %p')} - Lunch"
    t += 1.hour
    track(180).each do |talk|
      p "#{t.strftime('%l:%M %p')} - #{talk[:name]}"
      t += (talk[:length] * 60)
    end
    p "-------------------"
    @talks.each do |talk|
      p "#{talk[:name]} - #{talk[:length]}"
    end

  end

  def track(length)
    result_talks = []
    current_length = 0
    a = 0
    while (current_length != length) 
      talk = @talks[a]
      if current_length + talk[:length] <= length
        result_talks.push @talks.delete(talk)
        current_length += talk[:length]
      end
      a += 1
    end
    result_talks
  end

  def to_s

  end

end
