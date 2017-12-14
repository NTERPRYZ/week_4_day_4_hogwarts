require('pry-byebug')
require_relative ('../models/student')

Student.delete_all()

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house" => "Gryfindor",
  "age" => 11
  })

student2 = Student.new({
  "first_name" => "Ron",
  "last_name" => "Weasley",
  "house" => "Gryfindor",
  "age" => 11
  })

student3 = Student.new({
  "first_name" => "Hermoine",
  "last_name" => "Granger",
  "house" => "Gryfindor",
  "age" => 12
  })

student4 = Student.new({
  "first_name" => "Draco",
  "last_name" => "Malfoy",
  "house" => "Slytherin",
  "age" => 12
  })

student5 = Student.new({
  "first_name" => "Luna",
  "last_name" => "Lovegood",
  "house" => "Hufflepuff",
  "age" => 13
  })

student1.save
student2.save
student3.save
student4.save
student5.save

# student5.delete

binding.pry
nil
