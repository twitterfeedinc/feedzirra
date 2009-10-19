module Feedzirra
  # class holds the html response from urls that don't have xml
  class Html
    
    @body = nil
    @response_code = nil
    
    def initialize(response_code)
      @response_code = response_code
    end
    
    def body=(body)
      @body = body
    end
    
    def response_code
      @response_code
    end
    
    def body
      @body
    end
   
    def not_xml?
      true
    end
  end
  
end