class BinarySearch
  attr_reader :list

  def initialize(list)
    raise ArgumentError unless list.sort == list
    @list = list
  end

  def middle
    list.length / 2
  end

  def search_for(key)
    return middle if key == list[middle]

    sub = sublist(key)
    raise StandardError.new('not found') if validate_sub(sub)

    index = BinarySearch.new(sub).search_for(key)
    index = index + middle if key > list[middle]
    index
  end

  def validate_sub(sub)
    sub == list
  end

  def sublist(key)
    if key < list[middle]
      list[0..(middle-1)]
    else
      list[middle..-1]
    end
  end
end
