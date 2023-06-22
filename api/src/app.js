const express = require('express');

const app = express();

app.use(express.json());

const posts = [
    {
      date: '21/06/2023',
      title: 'Im a survivor',
      details: 'Música de Destinys Child'
    },
    {
      date: '20/06/2023',
      title: 'O show tem que continuar',
      details: 'Música de Beth Carvalho'
    }
  ];


app.get('/', (req, res) => res.status(200).json([{ date: "21/06/2023", title: 'All you need is love', details: "Música do The Beatles" }]));

app.get('/posts', (req, res) => res.status(200).json([
            {
            date: '21/06/2023',
            title: 'Im a survivor',
            details: 'Música de Destinys Child'
            },
            {
            date: '20/06/2023',
            title: 'O show tem que continuar',
            details: 'Música de Beth Carvalho'
            }
        ])
    )

app.post('/posts', (req, res) => {
    const newPost = { ...req.body };
    posts.push(newPost);
  
    res.status(201).json({ post: newPost });
  });



module.exports = app;