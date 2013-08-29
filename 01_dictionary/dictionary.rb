# class Dictionary
# Andrew Id: luningp

class Dictionary
  def initialize
    @hash = {}
  end

  def add(key_value)
    key_value.each do |key, value|
      @hash[key] = value
    end
  end

  def entries
     @hash
  end
  #sort hash keys alphabetically
  def keywords
     @hash.keys.sort
  end
  
  def include?(key_value)
     @hash.include? key_value
  end
  #find matches from a prefix
  def find(str)
    matched = {}
	@hash.keys.each do |key|
		if key.index(str)
			matched[key] = @hash[key]
		end
	end	
	return matched
  end
  
end