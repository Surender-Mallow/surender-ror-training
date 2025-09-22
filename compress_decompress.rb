input_string = $stdin.gets.chomp
compression_way = $stdin.gets.chomp

return if input_string.empty?

current_char = input_string[0]
converted_string = ""

if compression_way == "compress"
    current_count = 1
    (1..input_string.length).each do |i|
        if current_char != input_string[i]
            converted_string += "#{current_char}#{current_count}"
            current_char = input_string[i]
            current_count = 1
        else
            current_count += 1
        end
    end
elsif compression_way == "decompress"
    (1..(input_string.length - 1)).each do |i|
        unless input_string[i].scan(/[0-9]/).empty?
            converted_string += current_char * input_string[i].to_i
            current_char = input_string[i+1] unless i == (input_string.length - 1)
        end
    end
else
    p "Compression way doesn't exists"
    return
end


p converted_string