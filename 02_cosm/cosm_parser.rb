#cosm parser
#AndrewID: luningp

require "net/http"
require "uri"
require 'json'

class CosmParser
  #class method
  class << self
    def get_feed(feedid)
      uri = URI.parse("http://api.cosm.com/v2/feeds/" + feedid)
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri)
      request["X-ApiKey"] = "7fOn_xBHvPhrs0ZBkdau6GV2L_KSAKxzYlQyZHBPRUFtMD0g"
      response = http.request(request)
      return response.body
    end
    # convert_json_to_object
    def convert_json_to_ruby_object(json_str)
       JSON(json_str)
    end
  end
end

