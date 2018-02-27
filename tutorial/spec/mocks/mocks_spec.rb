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

  it 'args' do
    student = Student.new
    expect(student).to receive(:foo).with(1)
    student.foo(1)
  end

  it 'repetition' do
    student = Student.new
    expect(student).to receive(:foo).with(1).twice
    student.foo(1)
    student.foo(1)
  end

  it 'repetition' do
    student = Student.new
    expect(student).to receive(:foo).with(1).and_return(true)
    student.foo(1)
  end
end
