require 'bullet_time/scene'

describe BulletTime::Scene do
  let(:neo_mock) { double(:neography) }

  subject { described_class.new(neo_mock, 'query') }

  context '::setup' do
    it 'sets up neography and passes into new' do
      Neography::Rest.should_receive(:new).with('url').and_return(neo_mock)      
      scene = described_class.setup('url', 'query')
      scene.query.should == 'query'
      scene.neo.should == neo_mock
    end
  end

  context '#run_take' do
    it 'runs the query on neography' do
      neo_mock.should_receive(:execute_query).with('query')
      subject.run_take
    end
  end
end
