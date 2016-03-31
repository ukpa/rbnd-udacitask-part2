module UdaciListErrors
  # Error classes go here
  class IndexExceedsListSizeError < StandardError
  end
  class InvalidItemTypeError < StandardError
  end
  class InvalidPriorityValueError < StandardError
  end
end
