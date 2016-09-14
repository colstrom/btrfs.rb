require_relative 'subvolume'

module Btrfs
  class Volume
    attr_reader :path

    def initialize(path)
      @path = path
      self
    end

    def subvolumes
      `btrfs subvolume list -t #{path}`.lines.drop(2).map do |subvolume|
        Subvolume.new path, subvolume
      end
    end
  end
end
