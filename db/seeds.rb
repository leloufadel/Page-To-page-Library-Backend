User.create(name: "Sadaf", password:"654321",email:"sadaf@gmail.com",role:'admin')
User.create(name: "Garvin", password:"123456",email:"abc@gmail.com",role:'admin')
Book.create(name: "The Mountain", 
            cover_photo:"https://m.media-amazon.com/images/I/A1+wQ65OmSL.jpg", 
            author:"Helen Bryan", 
            publisher:"Lake Union", 
            publish_date:"2021-01-01", 
            category:"Fiction", 
            info:"This is a testing side of info")
Book.create(name: "Java", 
            cover_photo:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhW7iRAYZ5MELfAV0xmVrjzXygKUOiNveRug&usqp=CAU", 
            author:"Y.Daniel Liang",
            publisher:"Pearson", 
            publish_date:"2021-01-01", 
            category:"Programming", 
            info:"This is a testing side of info")
Book.create(name: "Ruby", 
            cover_photo:"https://lotusgemology.com/images/library/articles/book-reviews/ruby-sapphire-books/Halford-watkins-book-of-ruby-sapphire-cover.jpg", 
            author:"Y.Daniel Liang",
            publisher:"Pearson", 
            publish_date:"2021-01-01", 
            category:"Programming", 
            info:"This is a testing side of info")
Reservation.create(date: "2000-10-19", due_date: "2000-10-29", city: "Caracas", user_id: 1)

book = Book.first
reservation = Reservation.first

BookReservation.create(book: book, reservation: reservation)