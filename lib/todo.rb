require 'chronic'
class TodoItem
  include Listable
  include UdaciListErrors
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
    
  end

  def details
    (format_description(@description) + "due: " +
    format_date(@due)).colorize(:color=>:black,:background=>:white) +
    format_priority(@priority).to_s
  end
end
