require 'ruby-prof'
module BulletTime  
  class Rig
    attr_accessor :profiler

    def self.setup
      new(RubyProf)
    end

    def initialize(profiler)
      @profiler = profiler
    end

    def run_scene(scene, number_of_takes)
      profiler.start
      
      number_of_takes.times do
        scene.run_take
      end

      profiler.stop
    end
  end
end
