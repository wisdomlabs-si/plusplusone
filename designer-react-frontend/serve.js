const express = require('express');
const cors = require('cors');
const app = express();
const PORT = 8088;
app.use(cors());
// app.use('/', express.static('dist'))
app.use('/', express.static('public'));
app.listen(PORT, () => console.log(`Server listening on port: ${PORT}`));
