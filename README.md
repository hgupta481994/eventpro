# eventpro

Eventpro app displays a bunch of events. Users can register or login. They can visit an event page, attend an event and see who else is attending.


- Event Page
	- Display list of all other users who are attending (name & gender)
	- Actions: “Attend” / “Unattend” (Don’t display if the user is not allowed to attend - eg. when not logged in, or if it’s a past event)

- Users is not be allowed to attend/unattend a past event.
- User gets a 5% discount on the ticket if gender is female.

I am using sqlite as database and I have not removed developemt.sqlite3.
I have made seeds.rb file too for admin
