require_relative '../lib/grade_parser'
require 'json'

file = File.read("../data/grades.json")
all_grades = JSON.parse(file)

persons_in_decline = 0
persons_not_in_decline = 0
all_grades.each do |person, grades|
  parsed_grades = GradeParser.new(grades)
  parsed_grades.in_decline? ? persons_in_decline += 1 : persons_not_in_decline += 1
end

puts persons_in_decline
puts persons_not_in_decline