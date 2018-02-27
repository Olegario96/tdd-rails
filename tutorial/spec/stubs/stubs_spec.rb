require 'student'
require 'course'

describe 'Stub' do
  it '#has_finished?' do
    student = Student.new
    course = Course.new

    allow(student).to receive(:has_finished?).with(an_instance_of(Course)).and_return(true)
    finished_course = student.has_finished?(course)
    expect(finished_course).to be_truthy
  end

  it 'dynamic args' do
    student = Student.new
    allow(student).to receive(:foo) do |arg|
      if arg == :hello
        'hello'
      elsif arg == :hi
        'hi'
      end
    end
    expect(student.foo(:hello)).to eq('hello')
    expect(student.foo(:hi)).to eq('hi')
  end

  it 'any class instance' do
    student = Student.new
    other_student = Student.new
    allow_any_instance_of(Student).to receive(:bar).and_return(true)

    expect(student.bar).to eq(true)
    expect(other_student.bar).to eq(true)
  end

  it 'errors' do
    student = Student.new
    allow(student).to receive(:bar).and_raise(RuntimeError)
    expect{student.bar}.to raise_error(RuntimeError)
  end
end
