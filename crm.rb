
require_relative "contact.rb"

class CRM


    def self.run(name)
      # Implement this method
    end

    def initialize(name)
      @name = name
      puts "This crm has the name" + " " + name
    end

    def main_menu
      while true
        print_main_menu
        user_selected = gets.to_i
        call_option(user_selected)
      end
    end

    def print_main_menu
      puts '[1] Add a new contact'
      puts '[2] Modify an existing contact'
      puts '[3] Delete a contact'
      puts '[4] Display all the contacts'
      puts '[5] Search by attribute'
      puts '[6] Display contacts'
      puts '[7] Exit'
      puts 'Enter a number: '
    end

    def call_option(user_selected)
      case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then display_contacts
      when 7
        puts "Exit"
        exit
      else
        puts "You can't do that"
      end
    end
# ////////////////////////////////////////////////////////////
    def add_new_contact
      puts "Enter First Name"
      first_name = gets.chomp
      puts "Enter Last Name"
      last_name = gets.chomp
      puts "Enter Email Address"
      email = gets.chomp
      puts "Enter a Note"
      note = gets.chomp

      new_contact = Contact.create(first_name, last_name, email, note )
    end
# //////////////////////////////////////////////////////////////////////
    def modify_existing_contact
        display_all_contacts
        puts "Provide id for the contact you need"
        id_choice = gets.chomp.to_i
        found_contact = puts Contact.get(id_choice).inspect
        puts "What attribute you want to modify?"
        print_attr_choice
        attribute = gets.chomp.to_i
        # call_options_to_modify(chosen_attr)
        puts "What is the new value you want to put?"
        value = gets.chomp

        (Contact.get(id_choice)).update(attribute, value)
    end


    def print_attr_choice
      puts '[1] First Name'
      puts '[2] Second Name'
      puts '[3] Email'
      puts '[4] Note'
    end
    # ///////////////////////////////////////
    def display_contacts
      puts "Provide id for the contact you need"
      puts display_all_contacts
      id_choice = gets.chomp.to_i
      puts Contact.get(id_choice).inspect
    end
    #
# ///////////////////////////////////
    def delete_contact
      puts "Provide id for the contact you need"
      puts display_all_contacts
      id_choice = gets.chomp.to_i
      puts Contact.get(id_choice).inspect
      Contact.get(id_choice).delete

    end

# /////////////////////////////////////////////////

    def display_all_contacts
      Contact.all.each do |contact|
        puts "#{contact.id} #{contact.full_name} #{contact.email} #{contact.note} "
      end
    end
# ///////////////////////////////////////////////////////

    def search_by_attribute
      puts "Please provide attribute"
      print_attr_choice
      name = gets.chomp.to_i
      puts "Please provide value"
      value = gets.chomp
      puts Contact.search_by_attribute(name, value).inspect

    end
# ///////////////////////////////////////////////////////


    def self.run(name)
    crm = CRM.new(name)
    crm.main_menu
  end


end

# Run the program here (See 'Using a class method`)




CRM.run("Tusla")

# tribe_crm = CRM.new("name")
# tribe_crm.add_new_contact
# tribe_crm.main_menu
# tribe_crm.modify_existing_contact
# tribe_crm.delete_contact
# tribe_crm.display_all_contacts
# tribe_crm.search_by_attribute
# tribe_crm.display_contacts

# karma = CRM.new("Karma")
# karma.main_menu
