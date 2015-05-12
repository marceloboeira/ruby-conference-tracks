require "conference"

describe Conference do 

  let (:file) { File.read("spec/factories/fake_conference.txt")}

  it "works properly" do
    conference = Conference.new(starts_at: "09:00 AM", 
                                finishs_at: "05:00 PM", 
                                lunch_at: "11:30 AM", 
                                after_event_at: "05:00 PM", 
                                input: file)
    conference.start
    track_a = conference.to_s
    conference.start
    track_b = conference.to_s
    
    expect(track_a).to_not eq(track_b)
    [track_a, track_b].each do |track|
      expect(track).to include("Lunch")
      expect(track).to include("Networking Event")
    end
  end
end