require 'bullet_time/rig'

describe BulletTime::Rig do
  context '::setup' do
    it 'passes in the profiler to the rig' do
      rig = described_class.setup
      rig.profiler.should == RubyProf
    end
  end

  context '#run_scene' do
    let(:profiler) { double(:profiler) }
    let(:scene) { double(:scene, :run_take => nil) }
    subject { described_class.new(profiler) }

    it 'runs a scene multiple times, pausing in between each, then calls stop at the end' do
      profiler.should_receive(:start).ordered
      scene.should_receive(:run_take).twice
      profiler.should_receive(:stop).ordered.and_return(:profile)
      subject.run_scene(scene, 2).should == :profile
    end
  end
end
