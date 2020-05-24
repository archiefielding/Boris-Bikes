require 'bike'

describe Bike do

  it { is_expected.to respond_to :working? }

  it 'can be reported broken' do
    subject.report_broken
    expect(subject).to be_broken
  end

  it 'can be fixed' do
    subject.report_broken
    subject.fix
    expect(subject.broken?).to eq false
  end

end
