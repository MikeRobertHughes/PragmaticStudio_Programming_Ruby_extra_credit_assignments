# crowdfund.rb


def project_status(project, funding= "$4000" )
  "#{project.ljust(30,'.')}#{funding}"
end

def line_format
  "-".center(35, '-')
end

project1 = "Project ABC"
project2 = "Project DEF"
project3 = "Project GHI"
funding1 = "$1000"
funding2 = "$2000"
funding3 = "$4000"

puts "Funding per Project:"

puts line_format
puts project_status(project1, funding1)
puts line_format
puts project_status(project2, funding2)
puts line_format
puts project_status(project3, funding3)

puts "\nTotal funding: #{funding1.slice!(1..-1).to_i + funding2.slice!(1..-1).to_i + funding3.slice(1..-1).to_i}"
