module Feedzirra
  
  module Parser
    # == Summary
    # Parser for dealing with Atom feeds.
    #
    # == Attributes
    # * title
    # * feed_url
    # * url
    # * entries
    class Atom
      include SAXMachine
      include FeedUtilities
      element :title
      element :link, :as => :url, :value => :href, :with => {:type => "text/html"}
      element :link, :as => :feed_url, :value => :href, :with => {:type => "application/atom+xml"}
      elements :link, :as => :links, :value => :href
      elements :entry, :as => :entries, :class => AtomEntry
      
      elements :link, :as=>:hub_push_links, :value=>:href, :with=>{:rel=>"hub"}
      elements :"atom:link", :as => :atom_push_links, :value=>:href, :with=>{:rel=>"hub"}
      elements :"atom10:link", :as => :atom10_push_links, :value=>:href, :with=>{:rel=>"hub"}

      def self.able_to_parse?(xml) #:nodoc:
        xml =~ /(Atom)|(#{Regexp.escape("http://purl.org/atom")})/
      end
      
      def url
        @url || links.last
      end
      
      def feed_url
        @feed_url || links.first
      end
      
      def push_links
        @hub_push_links || @atom_push_links || @atom10_push_links
      end
    end
  end
  
end