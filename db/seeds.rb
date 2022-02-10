# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

authors = Author.create!([{first_name: "Timothy ", last_name:"Keller", age:70}, {first_name: "Robert Chire ", last_name:"Sproul", age:78}, {first_name: "John ", last_name:"Piper", age:68}])
users = User.create!([{username:"kalunge"}])

books = Book.create!([{title: "The meaning of Marriage", author: Author.first}, {title: "The Freedom of Self forgetfulbess", author: Author.second}, {title: "The Fear of Man", author: Author.third}, {title: "12 Rules for Life", author: Author.first}])