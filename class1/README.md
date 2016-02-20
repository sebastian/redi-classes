# Class 1

__What we will cover__
- high level overview of ruby
  - using `pry` ([http://pryrepl.org/](http://pryrepl.org/))
  - variables, basic operations, iterators
  - classes in ruby
- creating a hello world rails application
  - MVC
  - Create scaffold person

Everyone will work on their own laptops.
If you get stuck, or have problems, ask me, or each other for help.

__By the end__
- you should know the basics of Ruby
- be able to create a basic rails application, run and modify it

__Homework__
- [ ] create an account on github and send me your username
- [ ] augment the scaffold website created in the class so that you can transfer credits between people
  - this will require that you create a custom [route](http://guides.rubyonrails.org/routing.html). The [following](http://guides.rubyonrails.org/action_controller_overview.html#routing-parameters) might also be useful.
- [ ] create an account at [heroku](http://heroku.com/)
- [ ] deploy your website to heroku. Heroku has some [quite decent documentation](https://devcenter.heroku.com/articles/getting-started-with-rails4)

__Additional resources__
- ruby
  - [_why's Poignant guide to ruby](http://poignant.guide/). You might love or hate this. If you love it, then it is an excellent way of getting a good grasp on ruby, and an entertaining read to boot.
  - [Ruby in 100 minutes](http://tutorials.jumpstartlab.com/projects/ruby_in_100_minutes.html) is a nice quick read
  - [Learn Ruby the Hard Way](http://learnrubythehardway.org/book/) is another more indepth look at Ruby. I don't know this book myself
- git
  - [git in 15 minutes](https://try.github.io/levels/1/challenges/1)
  - [learn git branching](http://pcottle.github.io/learnGitBranching/) is a really excellent interactive tutorial that gives you a great understanding of the slightly more complex workflows you will encounter in your worklives. Well worth your time going through in my opinion.

---------------

# Ruby

## Basic operations 

Ruby is a dynamic scripting language. Most everything is an object.
It is very useful to use an interactive shell while playing with ruby.
The most common one is called `irb`, but we will be using one called `pry.

In your terminal, run the following command:

```
$ gem install pry
```

Ruby can be used as a calculator, as you would normally expect.

```ruby
$ pry
[1] pry(main)> 100 + 1
=> 101
[2] pry(main)> 100 * 2
=> 200
[3] pry(main)> 100 ** 3
=> 1000000
[4] pry(main)> "1".to_i * 2
=> 2
# Everything is an object, even numbers. You can call methods on them!
[5] pry(main)> 1.to_s
=> "1"
[6] pry(main)> name = gets
Sebastian
=> "Sebastian\n"
[7] pry(main)> puts "My name is #{name}"
My name is Sebastian
=> nil
```

## Classes

Save the following code in a file called `person.rb`:

```ruby
class Person
  @@people_count = 0

  # Automatically creates a getter and setter for the `name` variable.
  # These exist as `attr_reader` and `attr_writer` too.
  attr_accessor :name

  # The constructor is called `initialize`
  def initialize
    @name = "Unknown"
    @@people_count += 1
    # Goes out of scope after this method immediately
    local_variable = "local value"
  end

  # Instance method
  def greet
    puts "Hello there, my name is #{@name}."
  end

  # Class method
  def self.count
    puts "A total of #{@@people_count} people have been created"
  end
end
```

You can exercise this class in pry:

```ruby
$ pry
[1] pry(main)> require './person'
=> true
[2] pry(main)> Person.count
A total of 0 people have been created
=> nil
[3] pry(main)> p = Person.new
=> #<Person:0x007f866356aa40 @name="Unknown">
[4] pry(main)> p.greet
Hello there, my name is Unknown.
=> nil
[5] pry(main)> p.name = "Sebastian"
=> "Sebastian"
[6] pry(main)> p.greet
Hello there, my name is Sebastian.
=> nil
[7] pry(main)> Person.count
A total of 1 people have been created
# The power of pry comes in when you need to start debug
# your code! You can also edit your code directly:
[8] pry(main)> edit Person
# Add a method to your class called `debug` which contains one line `binding.pry`, 
# then exit your editor.
[9] pry(main)> p = Person.new
=> #<Person:0x3fefedee9950>
[10] pry(main)> p.debug

From: /Users/seb/projects/redi/classes/class1/app/person.rb @ line 27 Person#debug:

    26: def debug
 => 27:   binding.pry
    28: end

[11] pry(#<Person>)> @name
=> "Unknown"
[12] pry(#<Person>)> exit
=> nil
```

### Challenge:

- Create a person class
- A person should have a balance (i.e. a credit for how many hours they have available to spend)
- Create an instance method on person that takes another person as it's input and transfers one 
  hour from the person the method is being called on, to the person being passed in as an argument
- Add a method that prints the current balance of a person
- Exercise your program in the terminal to make sure it works


# Rails

We will create a dummy application in this class. It will eventually be thrown away, so don't hesitate to play around and experiment.
To create a basic rails application called `class1` and run it, use the following commands in your shell:

```shell
rails new class1
cd class1
bundle exec rails s
```

The application will now be running and available on `http://localhost:3000`.

The rails girls guides has an excellent step by step [guide](http://guides.railsgirls.com/app) you can follow if you get stuck when you try to replicate this by yourself. We will follow the rough steps from the rails girls guide when creating our first application, only that we will not upload images, and we will not create an `idea` system, but rather a system that allows us to add `person`s.
