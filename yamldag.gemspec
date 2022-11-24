Gem::Specification.new do |s|
    s.name          = 'yamldag'
    s.version       = '0.0.3'
    s.date          = '2022-11-23'
    s.summary       = 'a simple yaml file to generate DAG Graph and visualization'
    s.description   = "a simple yaml file to generate DAG Graph and visualization"
    s.authors       = ["bin"]
    s.email         = 'tangbineml@gmail.com'
    s.files         = ["lib/yamldag.rb"]
    s.executables << 'yamldag'
    s.homepage      = 'http://rubygems.org/gems/yamldag'
    s.license       = 'MIT'
    s.add_runtime_dependency "plexus"
    s.add_runtime_dependency "yaml"
end
