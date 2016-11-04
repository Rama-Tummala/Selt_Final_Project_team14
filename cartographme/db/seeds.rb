# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

key_locations = key_location.create([
      {
        lat: '41.659763', 
        lng: '-91.532282',
        location_name: 'Englert Civic Theatre'
      },
      {
        lat: '41.661291',
        lng: '-91.536145',
        location_name: "Old Capitol Museum."
      },
      {
        lat: '41.658718',
        lng: '-91.551107',
        location_name: "Kinnick Stadium."
      },
      {
        lat: '41.659401',
        lng: '-91.526448',
        location_name: "College Green Park."
      },
      {
        lat: '41.663622',
        lng: '-91.530299',
        location_name: "The Bluebird Diner."
      },
      {
        lat: '41.666768',
        lng: '-91.527106',
        location_name: "North Market Park."
      }
    ])