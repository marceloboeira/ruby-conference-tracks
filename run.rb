#!/usr/bin/ruby

require_relative 'lib/conference'

input = File.read("input.txt")

conference = Conference.new(starts_at: "09:00 AM", 
                            finishs_at: "4:00 PM", 
                            launch_at: "12:00 PM", 
                            after_event_at: "4:30 PM", 
                            input: input)
conference.start

puts "Track 1"
puts conference.to_s
puts "------------------------"
puts "Track 2"
conference.start
puts conference.to_s