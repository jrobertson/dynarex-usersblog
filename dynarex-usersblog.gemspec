Gem::Specification.new do |s|
  s.name = 'dynarex-usersblog'
  s.version = '0.2.8'
  s.summary = 'dynarex-usersblog'
    s.authors = ['James Robertson']
  s.files = Dir['lib/**/*.rb']
  s.add_dependency('dynarex-blog') 
  s.signing_key = '../privatekeys/dynarex-usersblog.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/dynarex-usersblog'
end
