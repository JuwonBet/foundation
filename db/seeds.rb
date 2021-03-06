# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#ActiveRecord::Base.connection.disable_referential_integrity do
#
#	p "Destroying Users"
#	User.destroy_all
#
#	p "Creating Users"
#	10.times do
#		user = User.create!([
#									first_name: Faker::Name.first_name,
#									last_name: Faker::Name.last_name,
#									email: Faker::Internet.email,
#									password: 'firstpass',
#									password_confirmation: 'firstpass'
#								])
#
#			user.each do |ur|
#			Bank.create!([
#										name: Faker::Bank.name,
#										account_name: Faker::Name.name,
#										account_number: Faker::Number.number(10),
#										user_id: ur.id
#									])
#		end
#	end
#
#	p "Created #{User.count} users"
#end


BankList.create([{ name: 'Access Bank Plc' }, { name: 'Diamond Bank Limited'}, { name: 'Ecobank Nigeria Plc'},
                { name: 'Equitorial Trust Bank Limited'}, { name: 'Fidelity Bank Plc' }, { name: 'First Bank of Nigeria Plc.'},
                { name: 'First City Monument Bank Ltd.' }, { name: 'Guaranty Trust Bank Plc.'}, { name: 'Intercontinental Bank Ltd.'},
                { name: 'StanbicIBTC Bank'}, { name: 'Standard Chartered Bank Nigeria Ltd'}, { name: 'Sterling Bank Plc'},
                { name: 'Union Bank of Nigeria Plc.'}, { name: 'United Bank for Africa Plc.'}, { name: 'Unity Bank'}, { name: 'Wema Bank Plc'},
                { name: 'Zenith International Bank Ltd.'}])