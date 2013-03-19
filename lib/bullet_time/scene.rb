require 'neography'

module BulletTime
  class Scene
    attr_accessor :query, :neo

    def self.setup(url, query)
      neography = Neography::Rest.new(url)
      new(neography, query)
    end

    def initialize(neography, query)
      @neo = neography
      @query = query
    end

    def run_take
      neo.execute_query(query)
    end
  end
end
