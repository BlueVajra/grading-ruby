require 'spec_helper'
require 'grade_parser'

describe GradeParser do
  it "parse grades" do
    grades = [6,3,5,4,3,4,4,5]
    parsed_grades = GradeParser.new(grades)
    actual = parsed_grades.velocity
    expected = [:down,:up,:down,:down,:up,:even,:up]
    expect(actual).to eq expected
  end

  it "checks finds if grades are in decline" do
    grades = [6,5,5,4,4,4,4,3]
    parsed_grades = GradeParser.new(grades)
    actual = parsed_grades.in_decline?
    expected = true
  end

  it "checks finds if grades are not in decline if last goes up" do
    grades = [6,5,5,4,4,4,4,5]
    parsed_grades = GradeParser.new(grades)
    actual = parsed_grades.in_decline?
    expected = false
  end

  it "checks finds if grades are not in decline if less than 3" do
    grades = [10, 9, 8]
    parsed_grades = GradeParser.new(grades)
    actual = parsed_grades.in_decline?
    expected = false
  end

  it "checks finds if grades are in decline if 3 downs" do
    grades = [10, 9, 8, 7]
    parsed_grades = GradeParser.new(grades)
    actual = parsed_grades.in_decline?
    expected = true
  end
end
