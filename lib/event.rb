class Event
  include HTTParty
  base_uri  'localhost:1337'
  
  attr_accessor :title, :description
  
  def initialize
  end
  
  def self.find_all_published
    response = HTTParty.get('http://localhost:1337/events', header: { 'Content-Type' => 'application/json' })
    response.parsed_response.map {|webinar| OpenStruct.new(webinar)}
  end
  
  def self.find_all
    response = HTTParty.get('http://localhost:1337/events?_publicationState=preview', header: { 'Content-Type' => 'application/json' })
    response.parsed_response.map {|webinar| OpenStruct.new(webinar)}
  end
  
  def self.find_all_drafts
    response = HTTParty.get('http://localhost:1337/events?_publicationState=preview&published_at_null=true', header: { 'Content-Type' => 'application/json' })
    response.parsed_response.map {|webinar| OpenStruct.new(webinar)}
  end
  
  def self.find(id)
    response = HTTParty.get("http://localhost:1337/events/#{id}", header: { 'Content-Type' => 'application/json' })
    OpenStruct.new(response.parsed_response)
  end
  
  def self.count
    response = HTTParty.get("http://localhost:1337/events/count", header: { 'Content-Type' => 'application/json' })
    response.parsed_response
  end
  
  def self.last(limit)
    response = HTTParty.get("http://localhost:1337/events?_sort=published_at:DESC&_limit=#{limit}", header: { 'Content-Type' => 'application/json' })
    response.parsed_response.map {|webinar| OpenStruct.new(webinar)}
  end
end