# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


key_locations = Key_Location.create([
      {
        lat: '41.659763', 
        lng: '-91.532282',
        infowindow: 'Englert Civic Theatre'
      },
      {
        lat: '41.661291',
        lng: '-91.536145',
        infowindow: "Old Capitol Museum."
      },
      {
        lat: '41.658718',
        lng: '-91.551107',
        infowindow: "Kinnick Stadium."
      },
      {
        lat: '41.659401',
        lng: '-91.526448',
        infowindow: "College Green Park."
      },
      {
        lat: '41.663622',
        lng: '-91.530299',
        infowindow: "The Bluebird Diner."
      },
      {
        lat: '41.666768',
        lng: '-91.527106',
        infowindow: "North Market Park."
      }
    ])
User.create(username: 'Nhan', password:"")
User.create(username: 'Nhan Tran', password:"")
User.create(username: 'Nhan Tran-Phan', password:"")
User.create(username: 'James', password:"")
User.create(username: 'Josh', password:"")
User.create(username: 'Jake', password:"")
User.create(username: 'Ramadevi', password:"")
User.create(username: 'Ash', password:"")
User.create(username: 'Ashlyn', password:"")
User.create(username: 'Ashley', password:"")
