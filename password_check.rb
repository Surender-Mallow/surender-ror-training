puts 'Enter your password:'
password = $stdin.gets.chomp

points = 0

if password.empty?
  puts 'Password is empty'
elsif !password.scan(/\s/).empty?
  puts 'Password contains whitespace'
else
  points += 2 if password.length >= 8
  points += 2 if password.length >= 12

  points += 1 unless password.scan(/[A-Z]/).empty?
  points += 1 unless password.scan(/[a-z]/).empty?
  points += 1 unless password.scan(/\d/).empty?
  points += 2 unless password.scan(/\W/).empty?

  puts points
  case points
  when 0..3
    puts 'Weak'
  when 4..6
    puts 'Medium'
  else
    puts 'Strong'
  end
end
