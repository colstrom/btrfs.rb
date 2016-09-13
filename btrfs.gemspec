Gem::Specification.new do |gem|
  gem.name        = 'btrfs'
  gem.version     = `git describe --tags --abbrev=0`.chomp
  gem.licenses    = 'MIT'
  gem.authors     = ['Chris Olstrom']
  gem.email       = 'chris@olstrom.com'
  gem.homepage    = 'https://github.com/colstrom/btrfs.rb'
  gem.summary     = 'Ruby Objects for btrfs concepts'

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.require_paths = ['lib']
end
