const http = require('http')
var os = require("os");
const hostname = os.hostname();
/*const hostname = request.headers.host*/
const port = 3000

const server = http.createServer((req, res) => {
  res.statusCode = 200
  res.setHeader('Content-Type', 'text/plain')
  res.end(`Hello World!! ${hostname}:${port}`)
})

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`)
})