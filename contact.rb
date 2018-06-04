class Contact
  @@contacts = []
  @@next_id = 1000

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, notes = 'N/A')
    @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes

    @id = @@next_id
    @@next_id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, notes)
    new_contact = self.new(first_name, last_name, email, notes)
    new_contact.save
    new_contact
  end
  # INSTANCE ATTRIBUTE READERS
  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def email
    @email
  end

  def notes
    @notes
  end

  def id
    @id
  end

  # INSTANCE ATTRIBUTE WRITERS
  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def email=(email)
    @email = email
  end

  def notes=(notes)
    @notes = notes
  end

  def full_name
    "#{ first_name } #{ last_name }"
  end

  def save
    @@contacts << self
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find
    @@contacts.each do |contact|
      if id_num == contact.id
        return contact
      end
    end
  end


  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, new_attribute)
    case attribute
    when 1 then self.first_name = new_attribute
    when 2 then self.last_name = new_attribute
    when 3 then self.email = new_attribute
    when 4 then self.notes = new_attribute
    when 5 then exit
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    case attribute
    when 1 then
      @@contacts.each do |person|
        if value.upcase == person.first_name.upcase
          return person
        end
      end
    when 2 then
      @@contacts.each do |person|
        if value.upcase == person.last_name.upcase
          return person
        end
      end
    when 3 then
      @@contacts.each do |person|
        if value.upcase == person.full_name.upcase
          return person
        end
      end
    when 4 then
      @@contacts.each do |person|
        if value.upcase == person.email.upcase
          return person
        end
      end
    else
      return "invalid"
    end
  end


  # This method should delete all of the contacts
  def self.delete_all
    delete = []
    @@contacts.each do |person|
      delete.push(person)
    end
    delete.each do |person|
      @@contacts.delete(person)
    end
  end



  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete(contact)
    @@contacts.delete(contact)
  end

  # Feel free to add other methods here, if you need them.

end
