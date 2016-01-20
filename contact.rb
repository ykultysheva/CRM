class Contact

  # Add any attr_reader and attr_accessors here
      attr_reader :id
      attr_accessor :first_name, :last_name, :email, :note



    # Add any class variables here
      @@contacts = []
      @@id = 1


      def initialize(first_name, last_name, email, note)
        @first_name = first_name
        @last_name = last_name
        @email = email
        @note = note
        @id = @@id
        @@id += 1
        # Implement this method
      end

      def self.create(first_name, last_name, email, note)
          #1. Create a new contact
          new_contact = Contact.new(first_name, last_name, email, note )
          #2. Add the new contact to the list
          @@contacts << new_contact
          #3. Return just created contact at the end of the method
          new_contact
      end

      #
      def self.all
        # Implement this method
         @@contacts
      end

      def self.get(id)
        @@contacts.find { |contact| contact.id == id }
      end

      def self.search_by_attribute(name, value)
        # Implement this method
          case name
          when 1 then @@contacts.find_all {|contact| contact.first_name == value}
          when 2 then @@contacts.find_all {|contact| contact.last_name == value}
          when 3 then @@contacts.find_all {|contact| contact.email == value}
            else
              puts "No contact found"
          endls

      end

      def self.delete_all
        @@contacts = []
      end

      def full_name
        "#{first_name} #{last_name}"
      end

      def update(attribute, value)
        if attribute == 1
          @first_name = value
        elsif attribute == 2
          @last_name = value
        elsif attribute == 3
          @email = value
        elsif attribute == 4
          @note = value
        else
          puts "Nothing to change"
        end
      end

  #
      def delete
        # @@contacts.delete_if {|contact| contact == self}
        @@contacts.delete(self)
      end


end

contact = Contact.new('Adrian', 'Carton de Wiart', 'adianwiart@gmail.com', 'Even cooler.')
