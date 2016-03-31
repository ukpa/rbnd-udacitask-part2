require 'artii'
class UdaciList
  include UdaciListErrors
  attr_reader :title, :items

  def initialize(options={title:"Untitled List"})
    @title = options[:title]
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    types=["todo","link","event"]
    if !types.include? type
      raise UdaciListErrors::InvalidItemTypeError, "Invalid file"
    end
    priorities =["high","medium","low",nil]
    if !priorities.include? options[:priority]
      raise UdaciListErrors::InvalidPriorityValueError,"Invalid priority"
    end
    @items.push TodoItem.new(description, options) if type == "todo"
    @items.push EventItem.new(description, options) if type == "event"
    @items.push LinkItem.new(description, options) if type == "link"
  end
  def delete(*indice)
    indice.sort!.reverse!
    indice.each do |index|
      if index-1>@items.length
        raise UdaciListErrors::IndexExceedsListSizeError ," Out of Range"
      end
      @items.delete_at(index - 1)

    end




  end
  def all
    a = Artii::Base.new
    puts "-" * @title.length*5
    puts a.asciify(@title)
    puts "-" * @title.length*5
    @items.each_with_index do |item, position|
      puts "#{position + 1})".colorize(:color=>:black,:background=>:white)+" #{item.class.to_s.colorize(:color=>:black,:background=>:white)}-#{item.details}".colorize(:background=>:white)
    end
  end

  def filter(val)
    puts "Filtered Value - #{val}"
    @items.each do |item|
      if item.class.to_s.downcase.chomp("item") == val
        puts item.details
      end
    end
  end

  def stats
    total = @items.length
    todo = 0
    event=0
    links=0
    @items.each do |item|
      todo+=1 if item.class.to_s.downcase.chomp("item")=="todo"
      links+=1 if item.class.to_s.downcase.chomp("item")=="link"
      event+=1 if item.class.to_s.downcase.chomp("item")=="event"
    end
    puts "#{@title} statistics"
    puts "Todos: #{todo} out of #{total}"
    puts "Links: #{links} out of #{total}"
    puts "Events: #{event} out of #{total}"
  end
end
