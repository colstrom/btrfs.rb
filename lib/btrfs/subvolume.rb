module Btrfs
  class Subvolume
    attr_reader :root, :record

    def initialize(root, record)
      @root = root.squeeze('/').chomp('/')
      @record = record.squeeze(' ').split
      self
    end

    def id
      @id ||= record.first
    end

    def generation
      @generation ||= record.slice(1)
    end

    alias_method :gen, :generation

    def top_level
      @top_level ||= record.slice(2)
    end

    def path
      @path ||= [root, record.last].join('/')
    end

    def deleted?
      @deleted == true
    end

    def delete
      return true if deleted?

      @deleted = system("btrfs subvolume delete #{path}")
    end

    def to_h
      {
        id: id,
        generation: generation,
        top_level: top_level,
        path: path
      }
    end
  end
end
