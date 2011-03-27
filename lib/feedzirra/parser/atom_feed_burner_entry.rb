module Feedzirra
  
  module Parser
    # == Summary
    # Parser for dealing with Feedburner Atom feed entries.
    #
    # == Attributes
    # * title
    # * url
    # * author
    # * content
    # * summary
    # * published
    # * categories
    class AtomFeedBurnerEntry
      include SAXMachine
      include FeedEntryUtilities
      element :title
      element :name, :as => :author
      element :link, :as => :url, :value => :href, :with => {:type => "text/html", :rel => "alternate"}
      element :"feedburner:origLink", :as => :url
      element :summary
      element :content
      element :published
      element :id
      element :issued, :as => :published
      element :created, :as => :published
      element :updated
      element :modified, :as => :updated
      elements :category, :as => :categories, :value => :term
      
      element :"geo:lat", :as => :geo_lat
      element :"geo:long", :as => :geo_long
      element :"georss:point", :as => :geo_point
      
    end

  end
    
end