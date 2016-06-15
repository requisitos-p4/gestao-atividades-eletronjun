# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users_list = [
  [ "Presidente", "presidente@gmail.com", "presidente" ],
  [ "Diretor", "diretor@gmail.com", "diretor" ],
  [ "Gerente", "gerente@gmail.com", "gerente" ],
  [ "Assessor", "assessor@gmail.com", "assessor" ],
  [ "Trainee", "trainee@gmail.com", "trainee" ],
  [ "Colaborador", "colaborador@gmail.com", "colaborador" ],
]

users_list.each do | name, email, role |
  User.create(name: name, email: email, role: role)
end
