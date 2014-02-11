module Feedzirra
  
  module Parser
    # == Summary
    # Parser for dealing with RSS feeds.
    #
    # == Attributes
    # * title
    # * feed_url
    # * url
    # * entries
    class RSS
      include SAXMachine
      include FeedUtilities
      
      element :title
      element :link, :as => :url
      
      element :generator
      
      elements :link, :as=>:hub_push_links, :value=>:href, :with=>{:rel=>"hub"}
      elements :"atom:link", :as => :atom_push_links, :value=>:href, :with=>{:rel=>"hub"}
      elements :"atom10:link", :as => :atom10_push_links, :value=>:href, :with=>{:rel=>"hub"}
      
      elements :item, :as => :entries, :class => RSSEntry

      attr_accessor :feed_url
      
      def generator
        @generator
      end

      def self.able_to_parse?(xml) #:nodoc:
        xml =~ /\<rss|\<rdf/
      end
      
      def push_links
        @hub_push_links || @atom_push_links || @atom10_push_links
      end
    end

  end
  
end