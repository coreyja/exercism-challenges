class School

  def initialize
    @students = []
  end

  def add(name, grade)
    @students << Student.new(name, grade)
  end

  def grade(grade)
    if students_by_grade.key? grade
      students_by_grade[grade].sort
    else
      []
    end
  end

  def students_by_grade
    classes.map { |grade,students| [grade, Class.new(students).sorted] }.to_h
  end

  private

  attr_reader :students

  def classes
    students.group_by(&:grade)
  end

  Student = Struct.new(:name, :grade)

  Class = Struct.new(:students) do
    def sorted
      students.map(&:name).sort
    end
  end
end

module BookKeeping
  VERSION = 2
end