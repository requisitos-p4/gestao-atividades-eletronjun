# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# roles for users
#  1 - presidente
#  2 - diretor
#  3 - gerente
#  4 - assessor
#  5 - trainee
#  6 - colaborador

users_list = [
  [ "Presidente", "presidente@gmail.com", 1 ],
  [ "Diretor", "diretor@gmail.com", 2 ],
  [ "Gerente", "gerente@gmail.com", 3 ],
  [ "Assessor", "assessor@gmail.com", 4 ],
  [ "Trainee", "trainee@gmail.com", 5 ],
  [ "Colaborador", "colaborador@gmail.com", 6 ]
]

boards_list = [
  [ "Projeto 1", "Descrição do projeto 1" ], 
  [ "Projeto 2", "Descrição do projeto 2" ] 
]

users_list.each do | name, email, role |
  User.create(name: name, email: email, role: role)
end

boards_list.each do | name, description |
  Board.create(name: name, description: description)
end
