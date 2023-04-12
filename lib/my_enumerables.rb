module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    until i == self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    return self unless block_given?
    arr = []
    self.my_each do |element|
      arr << element if yield(element)
    end
    arr
  end

  def my_all?
    return self unless block_given?
    result = true
    self.my_each { |i| result = false if yield(i) == false }
    return result
  end

  def my_any?
    return self unless block_given?
    result = false
    self.my_each { |i| result = true if yield(i) == true }
    return result
  end

  def my_none?
    return self unless block_given?
    result = true
    self.my_each { |i| result = false if yield(i) == true }
    return result
  end

  def my_count
    return self.length unless block_given?
    result = 0
    self.my_each { |i| result += 1 if yield(i) == true }
    return result
  end

  def my_map
    arr = []
    if block_given?
      self.my_each { |element| arr << yield(element) }
    else
      arr.to_enum :my_map
    end
    arr
  end

  def my_inject(acc = 0)
    if block_given?
      base = acc
      self.my_each do |element|
        base = yield(base, self[element])
      end
      base
    else
      self
    end
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    i = 0
    until i == self.length
      yield(self[i])
      i += 1
    end
    self
  end
end