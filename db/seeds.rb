# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

User.create!([
               name: 'Faiq Humayun',
               cnic: '3310067419771',
               voted: false,
               constituency_name: 'NA-201',
               user_status: 2,
               email: 'faiqhumayun46@gmail.com',
               password: '123456',
               constituency_id: '1'
             ])

Constituency.create([{ name: 'NA-201' }, { name: 'NA-202' }, { name: 'NA-203' }, { name: 'NA-204' },
                     { name: 'NA-205' }])
