console.log('May Node be with you')

const express = require('express')
const bodyParser = require('body-parser')
const app = express();
const MongoClient = require('mongodb').MongoClient

var db

MongoClient.connect('mongodb://db-user-admin:1234567890@ds139446.mlab.com:39446/gains-db', (err, database) => {
	if (err) return console.log(err)
	db = database
	app.listen(process.env.PORT || 3000, () => {
		console.log('listening on 3000')
	})
})

app.set('view engine', 'ejs')
app.use(bodyParser.urlencoded( {extended: true} ))
app.use(bodyParser.json())
app.use(express.static('public'))

app.get('/', (req, res) => {
	db.collection('cardioExercises').find().toArray((err, results) => {
		if (err) return console.log(err)
		res.render('index.ejs', {cardioExercises: results})
	})
})

app.post('/cardioExercises', (req, res) => {
	db.collection('cardioExercises').save(req.body, (err, result) => {
		if (err) return console.log(err)

		console.log('saved to database')
		res.redirect('/')
	})
})

app.put('/cardioExercises', (req, res) => {
	db.collection('cardioExercises').findOneAndUpdate(
		{'name': 'sasd'},
		{$set: {name: req.body.name, date: req.body.date, minutes: req.body.minutes, seconds: req.body.minutes}},
		{sort: {_id: -1}, upsert: true},
		(err, result) => {
			if (err) return res.send(err)
				res.send(result)
		})
})

app.delete('/cardioExercises', (req, res) => {
	db.collection('cardioExercises').findOneAndDelete(
	{name: req.body.name},
	(err, result) => {
		if (err) return res.send(500, err)
		res.send({message: 'An exercise got deleted'})
	})
})
