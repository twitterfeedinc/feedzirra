module Feedzirra
  
  module Parser
    # == Summary
    # Parser for dealing with Atom feed entries.
    #
    # == Attributes
    # * title
    # * url
    # * author
    # * content
    # * summary
    # * published
    # * categories
    class AtomEntry
      include SAXMachine
      include FeedEntryUtilities
      element :title
      element :link, :as => :url, :value => :href, :with => {:type => "text/html", :rel => "alternate"}
      element :name, :as => :author
      element :content
      element :summary
      element :published
      element :id
      element :created, :as => :published
      element :issued, :as => :published
      element :updated
      element :modified, :as => :updated
      elements :category, :as => :categories, :value => :term
      elements :link, :as => :links, :value => :href
      
      element :"geo:lat", :as => :geo_lat
      element :"geo:long", :as => :geo_long
      element :"georss:point", :as => :geo_point
      
      def url
        @url || links.first
      end
      
    end

  end
  
end