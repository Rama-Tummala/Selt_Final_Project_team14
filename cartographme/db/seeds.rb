
key_locations = KeyLocation.create([
      {
        lat: '41.659763', 
        lng: '-91.532282',
        name: 'Englert Civic Theatre',
        email: 'admin'
      },
      {
        lat: '41.661291',
        lng: '-91.536145',
        name: "Old Capitol Museum",
        email: 'admin'
      },
      {
        lat: '41.658718',
        lng: '-91.551107',
        name: "Kinnick Stadium",
        email: 'admin'
      },
      {
        lat: '41.659401',
        lng: '-91.526448',
        name: "College Green Park",
        email: 'admin'
      },
      {
        lat: '41.663622',
        lng: '-91.530299',
        name: "The Bluebird Diner",
        email: 'admin'
      },
      {
        lat: '41.666768',
        lng: '-91.527106',
        name: "North Market Park",
        email: 'admin'
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