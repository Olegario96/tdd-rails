describe 'Matcher output' do
  it { expect{print 'Olegario'}.to output.to_stdout}
  it { expect{print 'Olegario'}.to output('Olegario').to_stdout}
  it { expect{puts 'Olegario'}.to output(/Olegario/).to_stdout}

  it { expect{warn 'Olegario'}.to output.to_stderr}
  it { expect{warn 'Olegario'}.to output('Olegario\n').to_stderr}
  it { expect{warn 'Olegario'}.to output(/Olegario/).to_stderr}
end
