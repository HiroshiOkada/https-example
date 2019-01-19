#!/usr/bin/env node

const fs = require('fs')
const express = require('express')
const https = require('https')
const app = express()

const port = Number(process.env.PORT || 8443)

const options = {
  cert: fs.readFileSync('./certs/fullchain.pem'),
  key: fs.readFileSync('./certs/privkey.pem')
}

app.use(express.static('public'))

server = https
  .createServer(options, app)
  .listen(port, () => console.log(`start port=${port}`))
