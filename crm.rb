require_relative 'contact'

class CRM

  def main_menu
    # Repeat Indefinitly
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts "\n[1] Add a new contact"
    puts '[2] Modify a contact'
    puts '[3] Delete a contact'
    puts '[4] Display all contacts'
    puts '[5] Search'
    puts '[6] DELETE ALL'
    puts '[7] Exit'
    puts "\nEnter a number: "
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then delete_all
    when 7 then exit
    end
  end


# Deletes all contacts
  def delete_all
    puts "\e[H\e[2J"
    puts "ARE YOU SURE YOU WANT TO DELETE ALL CONTACTS? (yes/no)"
    user_value = gets.chomp
    case user_value.upcase
      when "YES"
        puts "\e[H\e[2J"
        puts "ALL CONTACTS DELETED!"
        Contact.delete_all
      when "NO"
         exit
      else
        exit
    end
  end


# Adds new contacts to @@contacts array
  def add_new_contact
    puts "\e[H\e[2J"

    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chop

    print 'Enter email (optional): '
    email = gets.chop

    print 'Enter a note (optional): '
    note = gets.chop

    contact = Contact.create(first_name, last_name, email, note)

    puts "\e[H\e[2J"
    puts "\nUPDATED!"
    puts "------------------------------\n"
    puts "Name: #{contact.first_name} #{contact.last_name}\nEmail: #{contact.email}\nNotes: #{contact.notes}\n"
    puts "------------------------------\n\n"

  end


# Modify contact information
  def modify_existing_contact
    puts "\e[H\e[2J"
    puts "Which contact would you like to modify?"
    contact = search_by_attribute
    puts "Please select which attribute to modify"
    print_modify_options
    user_attribute = gets.to_i
    puts "Please enter the new contact info: "
    user_value = gets.chomp
    contact.update(user_attribute, user_value)
    puts "\e[H\e[2J"
    puts "\nUPDATED!"
    puts "------------------------------\n"
    puts "Name: #{contact.first_name} #{contact.last_name}\nEmail: #{contact.email}\nNotes: #{contact.notes}\n"
    puts "------------------------------\n\n"

  end

  def print_modify_options
    puts '[1] First Name'
    puts '[2] Last Name'
    puts '[3] Email'
    puts '[4] Notes'
    puts '[5] cancel'
    puts 'Enter a number: '
  end

  def delete_contact
    puts "\e[H\e[2J"
    puts "Which contact would you like to delete?"
    contact = search_by_attribute
    puts "ARE YOU SURE YOU WANT TO DELETE? (yes/no)"
    user_value = gets.chomp
    case user_value.upcase
      when "YES"
         contact.delete(contact)
      when "NO"
         exit
      else
        exit
    end
    puts "\e[H\e[2J"
    puts "\nCONTACT DELETED!"
  end


# Display all contacts
  def display_all_contacts
    puts "\e[H\e[2J"
    puts "------------------------------\n\n"
    Contact.all.each do |person|
      puts "Name: #{person.first_name} #{person.last_name}\nEmail: #{person.email}\nNotes: #{person.notes}\n\n"
    end
    puts "------------------------------"
    return Contact.all
  end


# Search for a contact by desired attribute
  def search_by_attribute
    puts "\e[H\e[2J"
    puts "\nPlease select a contact attribute to search by."
    print_search_by_attribute_options
    user_attribute = gets.to_i
    #Attepted to loop back through function after contacts displayed
    # if user_attribute == 5
    #   display_all_contacts
    #   search_by_attribute
    if user_attribute == 5
      exit
    end

    puts "Please enter the contact's info: "
    user_value = gets.chomp
    contact = Contact.find_by(user_attribute, user_value)
    # Attempting safeguard
    # if contact == "invalid"
    #   return "INVALID OPTION"
    # end
    puts "\e[H\e[2J"
    puts "\n------------------------------"
    puts "Name: #{contact.first_name} #{contact.last_name}\nEmail: #{contact.email}\nNotes: #{contact.notes}"
    puts "------------------------------\n\n"
    return contact
  end

  def print_search_by_attribute_options
    puts "\n[1] First Name"
    puts "[2] Last Name"
    puts "[3] Full Name"
    puts "[4] Email"
    # puts '[5] View All Contacts"
    puts "[5] cancel"
    puts "\nEnter a number: "
  end

end

Contact.create("Kevin", "LeBlanc", "kleblanc@gmail.com", "Good guy")
Contact.create("Steven", "G", "steven@gmail.com", "Good hair")
Contact.create("Peter", "Parker", "peter@spiderman.com", "Swings")
test1 = Contact.create("Testy", "Testerson", "test@gmail.com", "This is test 1")
program = CRM.new
program.main_menu
