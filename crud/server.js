console.log('May Node be with you')

const express = require('express')
const bodyParser = require('body-parser')
const app = express();
const MongoClient = require('mongodb').MongoClient

var db

MongoClient.connect('mongodb://db-user-admin:1234567890@ds139446.mlab.com:39446/gains-db', (err, database) => {
	if (err) return console.log(err)
	db = database
	app.listen(3000, () => {
		console.log('listening on 3000')
	})
})

app.set('view engine', 'ejs')
app.use(bodyParser.urlencoded( {extended: true} ))
app.use(bodyParser.json())
app.use(express.static('public'))

app.get('/', (req, res) => {
	res.sendFile(__dirname + '/index.html')
})

// Reads

app.get('/cardio', (req, res) => {
	db.collection('cardioExercises').find().toArray((err, results) => {
		if (err) return console.log(err)
		res.render('cardio.ejs', {cardioExercises: results})
	})
})

app.get('/stretch', (req, res) => {
	db.collection('stretchExercises').find().toArray((err, results) => {
		if (err) return console.log(err)
		res.render('stretch.ejs', {stretchExercises: results})
	})
})

app.get('/weight', (req, res) => {
	db.collection('weightExercises').find().toArray((err, results) => {
		if (err) return console.log(err)
		res.render('weight.ejs', {weightExercises: results})
	})
})

// Creates

app.post('/cardioExercises', (req, res) => {
	db.collection('cardioExercises').save(req.body, (err, result) => {
		if (err) return console.log(err)

		console.log('saved to database')
		res.redirect('/cardio')
	})
})

app.post('/stretchExercises', (req, res) => {
	db.collection('stretchExercises').save(req.body, (err, result) => {
		if (err) return console.log(err)

		console.log('saved to database')
		res.redirect('/stretch')
	})
})

app.post('/weightExercises', (req, res) => {
	db.collection('weightExercises').save(req.body, (err, result) => {
		if (err) return console.log(err)

		console.log('saved to database')
		res.redirect('/weight')
	})
})

// Updates

app.put('/cardioExercises', (req, res) => {
	db.collection('cardioExercises').findOneAndUpdate(
		{'name': 'sasd'}, // ****************************************************************
		{$set: {name: req.body.name, date: req.body.date, minutes: req.body.minutes, seconds: req.body.minutes}},
		{sort: {_id: -1}, upsert: true},
		(err, result) => {
			if (err) return res.send(err)
				res.send(result)
		})
})

app.put('/stretchExercises', (req, res) => {
	db.collection('stretchExercises').findOneAndUpdate(
		{'name': 'sasd'}, // ****************************************************************
		{$set: {name: req.body.name, date: req.body.date, sets: req.body.sets, reps: req.body.reps}},
		{sort: {_id: -1}, upsert: true},
		(err, result) => {
			if (err) return res.send(err)
				res.send(result)
		})
})

app.put('/weightExercises', (req, res) => {
	db.collection('weightExercises').findOneAndUpdate(
		{'name': 'sasd'}, // ****************************************************************
		{$set: {name: req.body.name, date: req.body.date, weight: req.body.weight, sets: req.body.sets, reps: req.body.reps}},
		{sort: {_id: -1}, upsert: true},
		(err, result) => {
			if (err) return res.send(err)
				res.send(result)
		})
})

// Deletes

app.delete('/cardioExercises', (req, res) => {
	db.collection('cardioExercises').findOneAndDelete(
	{name: req.body.name}, // ****************************************************************
	(err, result) => {
		if (err) return res.send(500, err)
		res.send({message: 'An exercise got deleted'})
	})
})

app.delete('/stretchExercises', (req, res) => {
	db.collection('stretchExercises').findOneAndDelete(
	{name: req.body.name}, // ****************************************************************
	(err, result) => {
		if (err) return res.send(500, err)
		res.send({message: 'An exercise got deleted'})
	})
})

app.delete('/weightExercises', (req, res) => {
	db.collection('weightExercises').findOneAndDelete(
	{name: req.body.name}, // ****************************************************************
	(err, result) => {
		if (err) return res.send(500, err)
		res.send({message: 'An exercise got deleted'})
	})
})
