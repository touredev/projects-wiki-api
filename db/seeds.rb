# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Project.create(name: 'Portofolio', description: 'My portofolio web app', current_version: 1.0, techs_stack: 'Ruby Rails, JavaScript, PostgreSQL, Redis, Bootstrap, JQuery', link: 'http://localhost:3000')
Project.create(name: 'Web API', description: 'My api app sample', current_version: 1.2, techs_stack: 'Node, MongoDB, Redis', link: 'http://localhost:4000')
Project.create(name: 'Movies Library', description: 'Movies library web app', current_version: 1.0, techs_stack: 'React, Ruby on Rails, PostgreSQL, Redis, Bootstrap', link: 'http://localhost:5000')