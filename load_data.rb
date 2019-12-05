class Load_data

  def initialize(name)
    @entity_name=name
    file_name = @entity_name.to_s.downcase
    file = File.read("#{file_name}.json")
    @data_hash = JSON.parse(file)
  end

  def display_in_readable(json_block)
      json_block.each do |key, value|
        puts "#{key.ljust(30)} #{value}."
      end
  end

  def search_data_entity(key,value)
    flag=false
    if @data_hash[0].key?(key.strip)
      @data_hash.filter do |a|
         if a[key.strip].to_s == value.strip.to_s
           display_in_readable(a)
           flag=true
           break if flag
         else
           flag=false
         end
      end
      if !flag
        puts "Searching #{@entity_name} for #{key.strip} with a value of #{value.strip}"
        puts "No Result found"
      end
    else
      puts "Please enter the correct key (this key is not present)"
    end
  end

  def list_searchable_field
    puts @data_hash[0].keys
  end

end
