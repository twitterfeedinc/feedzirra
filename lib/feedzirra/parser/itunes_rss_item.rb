module Feedzirra
  
  module Parser
    # iTunes extensions to the standard RSS2.0 item
    # Source: http://www.apple.com/itunes/whatson/podcasts/specs.html
    class ITunesRSSItem
      include SAXMachine
      include FeedUtilities
      element :author
      element :guid
      element :title
      element :link, :as => :url
      element :description, :as => :summary
      element :pubDate, :as => :published

      # If author is not present use author tag on the item
      element :"itunes:author", :as => :itunes_author
      element :"itunes:block", :as => :itunes_block
      element :"itunes:duration", :as => :itunes_duration
      element :"itunes:explicit", :as => :itunes_explicit
      element :"itunes:keywords", :as => :itunes_keywords
      element :"itunes:subtitle", :as => :itunes_subtitle
      # If summary is not present, use the description tag
      element :"itunes:summary", :as => :itunes_summary
      element :enclosure, :value => :length, :as => :enclosure_length
      element :enclosure, :value => :type, :as => :enclosure_type
      element :enclosure, :value => :url, :as => :enclosure_url
      
      element :"geo:lat", :as => :geo_lat
      element :"geo:long", :as => :geo_long
      element :"georss:point", :as => :geo_point
      
    end
  end
  
end
