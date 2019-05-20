# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(
	name: "Christian",
	last_name: "Sanabria",
	email: "cdsanabriar@unal.edu.co",
	password: '12345678',
	password_confirmation: '12345678'
	)
user.save!

user = User.new(
	name: "Juan Sebastian",
	last_name: "Chaves",
	email: "jschavesr@unal.edu.co",
	password: '12345678',
	password_confirmation: '12345678'
	)
user.save!

user = User.new(
	name: "Laura",
	last_name: "Santos",
	email: "lbsantosg@unal.edu.co",
	password: '12345678',
	password_confirmation: '12345678'
	)
user.save!

user = User.new(
	name: "Diego",
	last_name: "Niquefa",
	email: "dsniquefav@unal.edu.co",
	password: '12345678',
	password_confirmation: '12345678'
	)
user.save!

user = User.new(
	name: "Juan Diego",
	last_name: "Moreno",
	email: "judmorenomo@unal.edu.co",
	password: '12345678',
	password_confirmation: '12345678'
	)
user.save!

