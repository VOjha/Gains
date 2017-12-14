var update = document.getElementById('update')

update.addEventListener('click', function () {
	fetch('stretchExercises', {
		method: 'put',
		headers: {'Content-Type': 'application/json'},
		body: JSON.stringify({
			'name': 'Zero',
			'date': '2000-01-01',
			'sets': '0',
			'reps': '0'
		})
	}).then(res => {
		if (res.ok) return res.json()
	})
	.then(data => {
		console.log(data)
		window.location.reload(true)
	})
})

var del = document.getElementById('delete')

del.addEventListener('click', function () {
	fetch('stretchExercises', {
		method: 'delete',
		headers: {'Content-Type': 'application/json'},
		body: JSON.stringify({
			'name': 'Zero'
		})
	})
	.then(res => {
		if (res.ok) return res.json()
	}).
	then(data => {
		console.log(data)
		window.location.reload(true)
	})
})
