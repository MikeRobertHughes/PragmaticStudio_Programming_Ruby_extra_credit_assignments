require_relative 'fundrequest'
proj1 = Project.new("ABC", 400)
proj2 = Project.new("DEF", 200)
proj3 = Project.new("GHI", 500)

nonprofits = FundRequest.new("Nonprofit Projects")
nonprofits.add_project(proj1)
nonprofits.add_project(proj2)
nonprofits.add_project(proj3)

loop do
  puts "\nHow many rounds of funding would you like? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    nonprofits.report(answer.to_i)
  when 'quit', 'exit'
    nonprofits.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end
