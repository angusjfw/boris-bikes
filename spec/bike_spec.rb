require 'bike'

describe Bike do

describe "#initialize" do
  it "@working? has default value true" do
  expect(subject.working).to eq true
end
end

it "Member of public can report bike is broken" do
  subject.working = false
  expect(subject.working).to eq false
end

  it 'Bike responds to working' do
    expect(subject).to respond_to :working
  end

end
