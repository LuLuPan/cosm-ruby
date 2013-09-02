#feed.rb
#AndrewID: luningp

require "./cosm_parser.rb"

class Feed
  attr_accessor :input
  def initialize(input)
	case input
    #json parse strings into key:value hash
    when String
		  @input = JSON(input)
    when Hash
		  @input = input
    end
  end

  
  def tags_array_for_datastream(index)
	array = []
	@input["datastreams"].each {|x| array << x["tags"]}
	return array[index]
  end
  
  def current_value_for_datastream(index)
	array = []
	@input["datastreams"].each {|x| array << x["current_value"]}
	return array[index]
  end
  
  def unit_label_for_datastream(index)
	array = []
	@input["datastreams"].each {|x| array << x["unit"]["label"]}
	return array[index]
  end

  #class method
  class << self
    def time_series(feeds, index)
      array = []
      case index
        when Integer
          feeds.each {|feed| array << feed.current_value_for_datastream(index)}
        when String
          feeds.each {|feed| feed.input["datastreams"].each {|x|
            if x["tags"] == [index]
              array << x["current_value"]
            end
          }
        }
      end
      return array
    end
  end

end
