require 'bullet_time'

describe BulletTime do
  let(:input) { {:url => 'foobar', :query => 'query', :count => 15} }
  let(:scene) { double(:scene) }
  let(:rig)   { double(:rig, :run_scene => nil) }
  let(:raw_footage) { double(:raw_footage) }

  before(:each) do
    BulletTime::Scene.stub(:setup).and_return(scene)
    BulletTime::Rig.stub(:setup).and_return(rig)
  end

  it 'sets up a scene using the url and the query' do
    BulletTime::Scene.should_receive(:setup).with('foobar', 'query').and_return(scene)
    described_class.run_scene(input)
  end

  it 'sets up a rig' do
    BulletTime::Rig.should_receive(:setup).and_return(rig)
    described_class.run_scene(input)
  end

  it 'uses the rig to run the scene' do
    rig.should_receive(:run_scene).with(scene, 15).and_return(raw_footage) 
    described_class.run_scene(input).should == raw_footage
  end
end
