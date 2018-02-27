require 'student'
require 'course'

describe 'Mocks' do
  it '#bar' do
    # Setup
    student = Student.new
    # Verify
    expect(student).to receive(:bar)
    # Exercise
    student.bar
  end
end
