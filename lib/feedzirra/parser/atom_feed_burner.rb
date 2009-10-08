module Feedzirra
  
  module Parser
    # == Summary
    # Parser for dealing with Feedburner Atom feeds.
    #
    # == Attributes
    # * title
    # * feed_url
    # * url
    # * entries
    class AtomFeedBurner
      include SAXMachine
      include FeedUtilities
      element :title
      element :link, :as => :url, :value => :href, :with => {:type => "text/html"}
      element :link, :as => :feed_url, :value => :href, :with => {:type => "application/atom+xml"}
      elements :entry, :as => :entries, :class => AtomFeedBurnerEntry
      
      elements :link, :as=>:hub_push_links, :value=>:href, :with=>{:rel=>"hub"}
      elements :"atom:link", :as => :atom_push_links, :value=>:href, :with=>{:rel=>"hub"}
      elements :"atom10:link", :as => :atom10_push_links, :value=>:href, :with=>{:rel=>"hub"}

      def self.able_to_parse?(xml) #:nodoc:
        (xml =~ /Atom/ && xml =~ /feedburner/) || false
      end
      
      def push_links
        @hub_push_links || @atom_push_links || @atom10_push_links
      end
    end

  end
  
end