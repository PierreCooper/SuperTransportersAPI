Please respect this data syntax for the following API endpoints :

**POST /transporters** :
```
{
	"transporter": {
		"name": "Pierre",
		"siret": "ABCD",
		"postal_codes": ["75000", "59000"],
		"carriers": [
			{
				"name": "Thierry",
				"age": 25,
				"has_driver_licence_a": false,
				"has_driver_licence_b": false,
				"has_driver_licence_c": true
			},
			{
				"name": "Benjamin",
				"age": 42,
				"has_driver_licence_a": false,
				"has_driver_licence_b": true,
				"has_driver_licence_c": true
			}
		]
	}
}
```

**PUT /carrier/:id/tracking**
```
{
	"tracking":
	{
		"latitude": 100,
		"longitude": 100,
		"altitude": 100
	}
}
```

