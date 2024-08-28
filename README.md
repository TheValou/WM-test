# README

Simple test to have good notificatgions based on date time in params

** Launching the project

`rake db:reset`
`rails server`

** Testing the route

You got an endpoint "http://localhost:3000/api/v1/phases/get_notifications" with params "current_date" and "phase_id"

If you don't provide a phase_id, one will be picked randomly. You must provide a current_date

Examples :

* `http://localhost:3000/api/v1/phases/get_notifications?current_date=2024-08-26T11:34+01:00`

* `http://localhost:3000/api/v1/phases/get_notifications?current_date=2024-08-26T15:34+01:00`

* `http://localhost:3000/api/v1/phases/get_notifications?current_date=2015-06-11T11:34+01:00&phase_id=LUTEAL_BEGIN_BOOST`
