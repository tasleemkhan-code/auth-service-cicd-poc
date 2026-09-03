const express = require('express');
const jwt = require('jsonwebtoken');
const app = express();
app.use(express.json());
const JWT_SECRET = process.env.JWT_SECRET || 'fallback-secret';

app.get('/health', (req, res) => res.json({ status: 'ok' }));
app.post('/login', (req, res) => {
  const { username } = req.body;
  const token = jwt.sign({ username }, JWT_SECRET, { expiresIn: '1h' });
  res.json({ token });
});
app.listen(8080, () => console.log('auth-service running on 8080'));
