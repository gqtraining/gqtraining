def greet_with(greeting)
  Proc.new do |*people|
    people.each do |person|
      puts "#{greeting} #{person}"
    end
  end
end

def time_it
  start=Time.now
  yield
  end_time=Time.now
  puts "it took #{end_time-start} to do stuff"
end
time_it do
  puts "asdf"
  sleep 3
end

def custom_greet(*people)
  people.each { |p| yield p }
end

custom_greet "GQuotient","Ganesh","Karthik","Ramesh","Kripa" do |p|
  puts "Hallo #{p}"
end

greeter = greet_with("hello")

greeter.call "GQuotient","Ganesh","Karthik","Ramesh","Kripa"
