class Application

  def run
    begin
      show_main_menu
      input = gets.chomp.downcase
      evaluate_input(input)
    end until input == "quit"
  end

  private

  # Prints the main menu only
  def show_main_menu
    puts "Welcome to the app. What's next?"
    puts " new      - Create a new contact"
    puts " list     - List all contacts"
    puts " find     - Find by name"
    puts " delete   - Delete by ID"
    puts " quit     - Exit Application"
    print "> "
  end

  def show_finder
    puts "By what means do you wish to locate a contact?"
    puts "-First Name"
    puts "-Last Name"
    puts "-Email"
  end

  def evaluate_input(input)
      case
      when input == "new"
        get_contact_details
      when input == "list"
        view_all
      when input == "find"
        puts "Enter a name:"
        name = gets.chomp
        find_by_name(name)
      when input == "delete"
        puts "What is the ID of the contact you wish to delete?"
        id = gets.chomp.to_i
        Contact.destroy(id)
      when input == "quit"
        "Thank you for using the contact list"
      else
          "This is not a valid input. Please try again"
      end
  end

  # def find_by_type(type)
  #     case
  #     when type == "first name"
  #       puts "Enter a first name:"
  #       name = gets.chomp
  #       find_by_first_name(name)
  #     when input == "last name"
  #       puts "Enter a last name:"
  #       last_name = gets.chomp
  #     when input == "email"
  #       puts "Enter an email:"
  #       email = gets.chomp
  #     else
  #       puts "This is not a valid input. Please try again"
  #     end
  # end
  
  # def get_name
  #   name = gets.chomp
  # end

  def find_by_name(name)
    # name = gets.chomp
    Contact.all.each do |contact|
      if contact.first_name == name || contact.last_name == name || "#{contact.first_name} #{contact.last_name}" == name
        puts "ID:#{contact.id} Name: #{contact.first_name} #{contact.last_name}, Email: #{contact.email}".colorize(:light_blue)
      end
    end
  end


  # def find_by_last_name
  #   name = gets.chomp
  #   Contact.all.each do |contact|
  #     if contact.first_name == name
  #       puts "ID:#{contact.id} Name: #{contact.first_name} #{contact.last_name}, Email: #{contact.email}".colorize(:light_blue)
  #     end
  #   end
  # end

  def view_all
    Contact.all.each do |contact|
      puts "ID:#{contact.id} Name: #{contact.first_name} #{contact.last_name}, Email: #{contact.email}".colorize(:light_blue)
    end
  end


  def new_contact(first_name, last_name, email)
    Contact.create(first_name: first_name, last_name: last_name, email: email)
  end

  def destroy
    Contact.destroy(id: id)
  end



  def get_contact_details
    puts "Enter contacts first name:"
    first_name = gets.chomp
    puts "Enter contacts last name:"
    last_name = gets.chomp
    puts "Enter your contacts email:"
    email = gets.chomp
    # puts "Enter your contacts phone number:"
    # phone = gets.chomp

    new_contact(first_name, last_name, email)
  end


end
