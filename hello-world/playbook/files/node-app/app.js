// app.js

const http = require('http');

const PORT = process.env.PORT || 3000; // Set default port to 3000 if not provided

const server = http.createServer((req, res) => {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World\n');
});

server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
