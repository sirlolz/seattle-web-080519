# Enumerables Lecture

### General tips

First off, try not to use Google search. I notice that it usually returns Ruby 2.2.0. This is not the most recent version. I would bookmark the 2.6.1 documentation and use that in your autocomplete.

Repl is a great resource. It is like IRB, but in a browser window.

### Odds and Ends

Ruby has an implicit return. When `return` isn’t explicitly called within a method, then Ruby returns the value of the last executed instruction in the method.

Actually using the `return` command is usually not preferred. It takes extra time to execute. Usually you will use it when you explicitly want to exit a loop with a certain value.

Using puts or print in a method outputs something to the command line. However, unless you otherwise add something else, such a method will return `nil`. This can lead to problems if you need the function to return a value.

```
def app
    puts "Hello World"
end

app
```

=> Hello World
=> nil

You may actually want this instead:

```
def app
  "Hello World"
end

app
```

### About the .[] method

```
array=[1,2,3]
array[“a”]

=> TypeError (no implicit conversion of String into Integer)

```

What does this mean? The array[] method only takes an integer. By passing “a”, clearly we are looking to find the value of a hash. But this is wrong because we are looking in an array. So, Ruby is saying "I can't convert this string, "a" into an integer to find the index in the array that you are looking for."

Instead of saying something like: “You are looking for a hash key in an array. You can’t do that.”, Ruby gives a cryptic, poorly worded error.

### Wrong arguments error

You must pass in as many arguments as you use in Ruby. The exception is the splat operator. We will cover this later.

```
def app(array, number)
    array.map do |num|
      num
    end
end

app([1,2,3,4,5])

=> wrong number of arguments (given 1, expected 2)
```

Given is the number of argumnents that the function was called with. Expected is the number of arguments that a function expects. In our test driven development, you can check in the Rspec test file to see exactly what is being called. This is a good way to debug this error in labs.

### Enumerables

A method that ends with a question mark returns a BOOLEAN.

This is a Ruby convention. If you write a method of your own and it returns a boolean, try to name it with a question mark.

Note that adding a question mark to the end of a method name does not automatically change the return type to a boolean.

```
def odd_finder?(num)
    num.odd?
end

odd_finder?(7)

# => true
```

A method in basic Ruby that ENDS with an exclamation point alters or mutates the original input. This is generally not preferred. Think about what you are doing here, and if you really want to alter the original, or make a copy and alter that.

Examples:

```
def app(array)
    array.slice!(0,2)
    array
end

app([1, 2, 3, 4, 5])

# => [3, 4, 5]
```

As compared to:

```
def app(array)
    array.slice(0,2)
    array
end

app([1, 2, 3, 4, 5])

# => [1, 2, 3, 4, 5]

```

As you can see, an exclamation point AT THE END of a method alters the original enumerable. Not every method can do this. Addidng an exclamation point does not automatically add this behavior.

Please note that the exclamation point is NOT the actual bang operator. Do not confuse the two.

Booleans refresher.

```
puts !!false
puts !!nil
puts !!''
puts !!0
puts !![]
puts !!{}
# => first 2 false, rest true

```

```
def app(array)
    array.map do |num|
      num
    end
end

app([1,2,3,4,5])

=> [1, 2, 3, 4, 5]

```

```
def app(array)
    array.map do |num|
        !num
    end
end

app([1,2,3,4,5])

=> [false, false, false, false, false]

```

### Aliases

`.inject` is an alias for `.reduce`
`.detect` is an alias for `.find`.
`.collect` is an alias for `.map`.
`.collect!` is an alias for `.map!`.
`.length` is an alias for `.size`.
`.filter` is an alias for `.select`.
`.filter!` is an alias for `.select!`.
`.prepend` is an alias for `.unshift`.
`.append` is an alias for `.shift`.
`<<` "shovel" is an alias for `.push`.
`.update` "shovel" is an alias for `.merge!`.
`.find_all` and `.select` are very similar. They are almost aliases.

### .map vs .each

`.map` invokes the given block once for each element of self.
Creates a new array containing the values returned by the block.

This is preferred over `.each`. It is more professional.

```
def app(array)
    newArray=[]
    array.each do |num|
        newArray << num * 2
    end
    newArray
end

app([1,2,3,4,5])

=> [2, 4, 6, 8, 10]
```

This is called sandwich code. The newAr on the top and the bottom are the slices of bread. It is best to be avoided. It is harder to read, longer, and more error prone. Below is better.

```
def app(array)
    array.map do |num|
        num*2
    end
end

app([1,2,3,4,5])

=> [2, 4, 6, 8, 10]
```

### .select

Returns a new array containing all elements of array for which the given block returns a TRUE value.

```
def app(array)
    array.select do |num|
        num.odd?
    end
end

app([1,2,3,4,5])

=>[1,3,5]

```

```

def app(array)
    array.select do |num|
        !num.odd?
        # same as .even?
    end
end

app([1,2,3,4,5])

=> [2,4]

```

### .select!

```

def app(array)
    array.select! do |num|
        num.odd?
    end
end

app([1,2,3,4,5])

=> [1,3,5]

```

Notice below that when I return the original array, it has been altered. Both the original array and the new one have been altered to [1,3,5]

```

def app(array)
    array.select! do |num|
        num.odd?
    end
    array
end

app([1,2,3,4,5])

=> [1,3,5]

```

### .reject is the opposite of .select.

```

def app(array)
    array.reject do |num|
        num.odd?
    end
end

app([1,2,3,4,5])

=> [2,4]

```

SAME AS

```

def app(array)
    array.select do |num|
        !num.odd?
    end
end

app([1,2,3,4,5])

=> [2,4]

```

### .find_all and .select

`.find_all` and `.select` are very similar.

For arrays they are the same.

For hashes they return different values.

`.find_all` returns an array of answers.

`.select` returns the original item. Which, in the case of hashes, is a hash.

```

def app
    my_hash={"one" => "1", "two" => "2", "three" => "3", "four" => "3"}
    my_hash.find_all do |key, value|
    # my_hash.select do |key, value|
        value =="3"
    end
end

find_all => [["three", "3"], ["four", "3"]]
select => {"three"=>"3", "four"=>"3"}

```

### Various methods

`.all?`Returns true if EVERY item is neither nil or false.
`.any?` Returns true if ONE or more item is neither false nor nil.
`.one?` Returns true if ONE AND ONLY ONE item is neither false nor nil.
`.none?`Returns true if NO element returns true.

```

def app(array)
    array.none? do |num|
        num>4
    end
end

app([1,2,3,4,5])

=> false

.all? => false
.any? => true
.none? => false
.one? => false

```

`.include?` Returns true if ANY item is included.

```

def app?(array)
    array.include?(3)
end

app?([1,2,3,4,5])

=> true

```

`.uniq` removes duplicates.

```
def app(array)
    array.uniq
end

app([1,2,3,4,5,5,5,5,5])

=> [1, 2, 3, 4, 5]
```

`.compact` removes nils.

```
def app(array)
    array.compact
end

app([1,2,3,4,5, nil, nil])

=> [1, 2, 3, 4, 5]

```

`.flatten` removes nested arrays.

```
def app(array)
array.flatten
end

app([1,[2],3,4,5,[6,7]])

=> [1, 2, 3, 4, 5, 6, 7]

```

`.take`takes the first x from an array.

```
def app(array)
    array.take(3)
end

app([1,2,3,4,5, nil, nil])

=> [1, 2, 3]

```

`.sum`adds up an enumerable.

```

def app(array)
array.sum
end

app([1,2,3,4,5])

=> 15
```

### .sort

`.sort`

Syntax: Must pass 2 arguments.

<=> is flying saucer operator, a good shortcut.

```

def app(array)
    array.sort do |a, b|
        a<=>b
    end
end

app([5,4,3,2,1])

=> [1, 2, 3, 4, 5]

```

If no loop, there is a default behavior.

```

def app(array)
    array.sort
end

app(["coffee", "apple", "bannana"])

=> ["apple", "bannana", "coffee"]

```

`.sory_by`

```

def app(array)
    array.sort_by do |word|
        word.length
    end
end

app(["apple", "bannana", "coffee"])

=> ["apple", "coffee", "bannana"]

```

`.min`and `.max`are same syntax as `.sort`, but return only one answer, the max or min.

Similar to SQL query sort asc or desc limit 1.

```

def app(array)
    array.minmax do |a, b|
        a<=>b
    end
end

app([5,4,3,2,1])

=> [1, 5]

```

### Various other methods

`.max_by`, `.min_by` and `.minmaxby` use the same syntax as `.sort_by`.

```

def app(array)
    array.minmax_by do |word|
        word.length
    end
end

app(["the", "an", "a"])

=> ["a", "the"]

```

`.each_with_index`

Notice that index starts at zero. You can manually add +1 in the string interpolation to offset it.

```

def app(array)
    array.each_with_index do |word, index|
        puts "#{index} is #{word}"
    end
end

app(["the", "an", "a"])

0 is the
1 is an
2 is a

=> ["the", "an", "a"]

```

vs.

`.with_index`

This can be used with .map to provide an index. Or other functions. It also takes an optional parameter of a starting index.

```

def app(array)
    array.each.with_index(1) do |num, index|
        puts "This is index #{index}. The number is #{num}"
    end
end

app([1,2,3,4,5])

```

### The Conditional Assignment Operator

a ||= b

Means

a || (a = b)

“ `a`, or if `a` is false or nil or undefined, evaluate `b` and set the RESULT to a new variable, `a`”

```
def app(array)
    a = nil
    b = 10
    a ||= b
    a
end

app
```

Another example

```
def app
    b = 10
    a ||= b
    a
end

app
```
