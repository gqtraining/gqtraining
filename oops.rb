module Greeter
  private
  def greet
    puts "hello #{@name}"
  end
end
module MyClassModule
  def info
    puts "some random information"
  end
end
class MyClass
  include Greeter
  extend MyClassModule
  @@doc_message = "MyClass is an awesome class"
  def self.doc_message
    @@doc_message
  end
  def self.doc_message=(newval)
    @@doc_message=newval
  end
  def initialize(name="somename")
    @name=name
  end
  def hello
    puts "hello method called"
  end
end
class MyClass2 < MyClass
  def greet
    puts "Modified hello #{@name}"
  end
  def method_missing(method_name,*args)
    if (method_name==:hello2)
      hello
    else
      puts "No matching method found"
    end
  end
end

class Customer
  attr_accessor :attributes
  # attr_reader :attributes
  # attr_writer :attributes
  def initialize(fields={})
    @attributes=fields
  end
  def method_missing(method_name,*args)
    @attributes[method_name]
  end
  #def attributes
    #@attributes
  #end
  #def attributes=(newval)
    #@attributes=newval
  #end
end
customer1 = Customer.new
customer1.attributes={name: "Vagmi Mudumbai",address: "Pallikaranai"}
puts customer1.name #customer1.attributes[:name]
puts customer1.address

obj1 = MyClass.new("Ganesh")
obj1.send(:greet)

obj2 = MyClass2.new("Vagmi")
obj2.send(:greet)

MyClass.info
MyClass2.info
