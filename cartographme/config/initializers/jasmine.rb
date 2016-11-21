if defined?(JasmineRails)
  JasmineFixtureServer = Proc.new do |env|
    Rack::Directory.new('spec/javascripts/fixtures').call(env)
  end
end