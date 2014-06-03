module Welcome
  def welcome
    puts "Press H for hot stories or N for new stories, or Q to quit."
    input = gets.chomp.upcase

    until (input == "N" or input == "H" or input == "Q")
      puts "Sorry, please enter a valid command: N, H, or Q."
      input = gets.chomp.upcase
    end

    case input
    when "N"; show_new_title
    when "H"; show_hot_title
    when "Q"; puts "Thanks for reading!"
    end
  end
end
