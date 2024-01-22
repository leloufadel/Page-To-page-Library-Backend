User.create(name: "Sadaf", password:"654321",email:"sadaf@gmail.com")
User.create(name: "Garvin", password:"123456",email:"abc@gmail.com")
Book.create(name: "The Alchemist", 
            cover_photo:"test.png", 
            author:"THE Author", 
            publisher:"One", 
            publish_date:"2021-01-01", 
            category:"Fiction", 
            info:"This is a testing side of info")
Book.create(name: "The Magician", 
            cover_photo:"test3.png", 
            author:"THE Writer",
            publisher:"One", 
            publish_date:"2021-01-01", 
            category:"Fiction", 
            info:"This is a testing side of info")
Book.create(name: "The Doctor", 
            cover_photo:"test2.png", 
            author:"THE Medic",
            publisher:"One", 
            publish_date:"2021-01-01", 
            category:"Fiction", 
            info:"This is a testing side of info")
Reservation.create(date: "2000-10-19", due_date: "2000-10-29", city: "Caracas", user_id: 1)

book = Book.first
reservation = Reservation.first

BookReservation.create(book: book, reservation: reservation)