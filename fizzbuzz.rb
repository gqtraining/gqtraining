def print_fb(start,end_val)
  start.upto(end_val) do |i|
    output = ""
    output+="fizz" if i%3==0
    output+="buzz" if i%5==0
    output=i if output==""
    print "#{output} "
  end
end
print "Enter a starting number > "
start = gets.to_i
print "Enter a ending number > "
end_val = gets.to_i
print_fb start, end_val
