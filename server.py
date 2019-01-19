#!/usr/bin/env python3

from http import server
import ssl
import os

if __name__ == '__main__':
    address = ('0.0.0.0', 8443)

    context = ssl.create_default_context(ssl.Purpose.CLIENT_AUTH)
    context.load_cert_chain('certs/fullchain.pem', 'certs/privkey.pem')

    os.chdir('public')
    httpd = server.HTTPServer(address, server.SimpleHTTPRequestHandler)
    httpd.socket = context.wrap_socket(httpd.socket)

    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        pass

    httpd.server_close()
