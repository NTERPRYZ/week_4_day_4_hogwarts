require_relative('../db/sql_runner')

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :house, :age

  def initialize( options )
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house']
    @age = options['age'].to_i
  end


  def save
    sql = "INSERT INTO students (first_name, last_name, house, age)
          VALUES ($1, $2, $3, $4)
          RETURNING *"

          values = [@first_name, @last_name, @house, @age]
          student_data = SqlRunner.run(sql, values)
          @id = student_data.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM students WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  #--------------- CLASS METHODS -----------------#

  def self.delete_all()
    sql = "DELETE FROM students;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    result = students.map{ |student| Student.new (student)}
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values)
    result = Student.new(student[0])
  end




end
