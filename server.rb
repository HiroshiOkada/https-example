#!/usr/bin/env ruby

require 'webrick'
require 'webrick/https'

port = (ENV['PORT'] || 8443).to_i

puts "port=#{port}"

httpd = WEBrick::HTTPServer.new({
  DocumentRoot: './public',
  BindAddress: '0.0.0.0',
  Port: port,
  Logger: WEBrick::Log.new(nil, level=WEBrick::BasicLog::WARN),
  SSLEnable: true,
  SSLCertificate: OpenSSL::X509::Certificate.new(File.open('./certs/cert.pem').read),
  SSLExtraChainCert: [OpenSSL::X509::Certificate.new(File.open('./certs/chain.pem').read)],
  SSLPrivateKey: OpenSSL::PKey::RSA.new(File.open('./certs/privkey.pem').read)
})

Signal.trap('INT') {
  httpd.shutdown
}

httpd.start()

