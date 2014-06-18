class GradeParser
  def initialize(grades)
    @parsed_grades = parse_grades(grades)
  end

  def velocity
    @parsed_grades
  end

  def in_decline?
    in_decline = false
    downs =0
    @parsed_grades.each do |direction|

      if direction == :down
        downs += 1
      elsif direction == :up
        downs = 0
      end

      if downs >= 3
        in_decline = true
      else
        in_decline = false
      end
    end
    in_decline
  end

  def parse_grades(grades)
    result = []
    previous_grade = 0
    grades.each_with_index do |grade, index|
      if index == 0
        previous_grade = grade
        next
      end
      if grade > previous_grade
        result << :up
      elsif grade == previous_grade
        result << :even
      else
        result << :down
      end
      previous_grade = grade
    end
    result
  end

end