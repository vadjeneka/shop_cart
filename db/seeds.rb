# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.create(name:'Green', code:'GR1', price:'3.11')
product1 = Product.create(name:'Strawberries', code:'SR1', price:'5.00')
product2 = Product.create(name:'Coffe', code:'CF1', price:'11.23')
