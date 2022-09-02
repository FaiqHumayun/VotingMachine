# frozen_string_literal: true

User.destroy_all
Constituency.destroy_all
Schedule.destroy_all

Constituency.create([{ name: 'NA-201' }, { name: 'NA-202' }, { name: 'NA-203' }, { name: 'NA-204' },
                     { name: 'NA-205' }])

Schedule.create([
                  election_start_time: DateTime.now,
                  election_end_time: DateTime.tomorrow
                ])
User.create!([
               name: 'Faiq Humayun',
               cnic: '3310067419771',
               voted: false,
               constituency_name: Constituency.find_by(name: 'NA-201')&.name,
               user_status: 2,
               email: 'faiqhumayun46@gmail.com',
               password: '123456',
               constituency_id: Constituency.find_by(name: 'NA-201')&.id
             ])
