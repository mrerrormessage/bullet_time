require 'bullet_time/scene'
require 'bullet_time/rig'

module BulletTime
  def self.run_scene(scene_params={})
    scene = BulletTime::Scene.setup(scene_params[:url], scene_params[:query])
    rig = BulletTime::Rig.setup
    rig.run_scene(scene, scene_params[:count])
  end
end
