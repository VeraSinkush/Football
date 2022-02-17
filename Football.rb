
file = File.open(ARGV[0])

table = file.readlines.map(&:chomp)
file.close

def get_information(line)
  line.split(', ')
end


new_t = table.map { |el| get_information(el) }
r_t = new_t.map { |el| el.map {|value| [value.split[0..-2].join(' '), value.split[-1].to_i]} }

r_t.each_index do  |i|
  if r_t[i][0][1] == r_t[i][1][1]
    r_t[i][0][1] = 1
    r_t[i][1][1] = 1
  elsif r_t[i][0][1] < r_t[i][1][1]
    r_t[i][0][1] = 0
    r_t[i][1][1] = 3
  else r_t[i][0][1] > r_t[i][1][1]
    r_t[i][0][1] = 3
    r_t[i][1][1] = 0
  end
end
r_t.flatten!(1).sort!
r_t_hash = {}
r_t.each do |el|
  sum = 0
  r_t.each { |val| sum += val[1] if val[0] == el[0] }
  r_t_hash[el[0].to_sym] = sum
end
result = r_t_hash.to_a

result.each_index { |i| result[i][0], result[i][1] = -result[i][1], result[i][0].to_s}

result.sort!

result.each_index {|i| puts"#{i+1}. #{result[i][1]}, #{-result[i][0]} #{result[i][0] == -1 ? 'pt' : 'pts'}" }






