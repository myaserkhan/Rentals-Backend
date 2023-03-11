# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
user1 = User.create!(username: "Sajeel Zafar", email: "sajeelzafar1995@gmail.com")
user2 = User.create!(username: "Yasir Khan", email: "hopedaphine19@gmail.com")
user3 = User.create!(username: "Hope Daphine", email: "kiokoj81@gmail.com")
user4 = User.create!(username: "John Mutisya", email: "khanyaser007@gmail.com")

car1 = Car.create!(name: "Mehran", description: "Affordable car", price: 1500, duration: 3, imgurl: "https://cache2.pakwheels.com/system/car_generation_pictures/2873/original/Suzuki_Mehran_2012.jpg?1444111663", brand: "Suzuki")
car2 = Car.create!(name: "Cultus", description: "Hatchback car", price: 2500, duration: 4, imgurl: "https://cache4.pakwheels.com/system/car_generation_pictures/6014/original/Suzuki_Cultus_-_PNG.png?1635945515", brand: "Suzuki")
car3 = Car.create!(name: "Corolla", description: "Easy to maintain car", price: 3000, duration: 2, imgurl: "https://toyota-central.com/Assets/images/Vehicle/CorollaX/Exterior4.jpg", brand: "Toyota")
car4 = Car.create!(name: "Civic", description: "Expensive car with a modern design", price: 3000, duration: 2, imgurl: "https://toyota-central.com/Assets/images/Vehicle/CorollaX/Exterior4.jpg", brand: "Honda")

reservation1 = Reservation.create!(user: user1, car: car1, city_name: "Islamabad", date: "2023-11-03")
reservation2 = Reservation.create!(user: user2, car: car2, city_name: "Karachi", date: "2023-11-04")
reservation3 = Reservation.create!(user: user3, car: car1, city_name: "Lahore", date: "2023-11-05")
reservation4 = Reservation.create!(user: user4, car: car4, city_name: "Peshawar", date: "2023-11-06")
