 # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


key_locations = KeyLocation.create([
      {
        lat: '41.659763', 
        lng: '-91.532282',
        name: 'Englert Civic Theatre'
      },
      {
        lat: '41.661291',
        lng: '-91.536145',
        name: "Old Capitol Museum."
      },
      {
        lat: '41.658718',
        lng: '-91.551107',
        name: "Kinnick Stadium."
      },
      {
        lat: '41.659401',
        lng: '-91.526448',
        name: "College Green Park."
      },
      {
        lat: '41.663622',
        lng: '-91.530299',
        name: "The Bluebird Diner."
      },
      {
        lat: '41.666768',
        lng: '-91.527106',
        name: "North Market Park."
      }
    ])
User.create!(name: 'Nhan', email: "ntran93@gmail.com", password:"123456", password_confirmation:"123456")
User.create!(name: 'Nhan Tran', email: "n@gmail.com", password:"123456", password_confirmation:"123456")
User.create!(name: 'Nhan Tran-Phan', email: "ntp@gmail.com", password:"123456", password_confirmation:"123456")
User.create!(name: 'James', email: "james@gmail.com", password:"123456", password_confirmation:"123456")
User.create!(name: 'Josh', email: "josh@gmail.com", password:"123456", password_confirmation:"123456")
User.create!(name: 'Jake', email: "jake@gmail.com", password:"123456", password_confirmation:"123456")
User.create!(name: 'Ramadevi', email: "rama@gmail.com", password:"123456", password_confirmation:"123456")
User.create!(name: 'Ash', email: "ash@gmail.com", password:"123456", password_confirmation:"123456")
User.create!(name: 'Ashlyn', email: "ashlyn@gmail.com", password:"123456", password_confirmation:"123456")
User.create!(name: 'Ashley', email: "ashley@gmail.com", password:"123456", password_confirmation:"123456")


#following relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each {|followed| user.follow(followed)}
followers.each {|follower| follower.follow(user)}