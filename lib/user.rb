class User
  attr_accessor :email, :age
  @@user_count = 0
  def initialize(email_save, age_save)
    @email = email_save
    @age = age_save
    @@user_count += 1
  end

  def self.all
    return @@user_count
  end
  
  def to_s
    puts "Email : #{@email}"
    puts "Age : #{@age}"
  end
end
habib = User.new("faye@gmail.com", 24)
ibrahima = User.new("ndao@gmail.com", 25)
habib.to_s
puts "-----------------------------------"
ibrahima.to_s
puts
p User.all
puts "***********************************************"