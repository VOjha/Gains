var update = document.getElementById('update')

update.addEventListener('click', function () {
	fetch('cardioExercises', {
		method: 'put',
		headers: {'Content-Type': 'application/json'},
		body: JSON.stringify({
			'name': 'Zero',
			'date': '2000-01-01',
			'minutes': '0',
			'seconds': '0'
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
	fetch('cardioExercises', {
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
