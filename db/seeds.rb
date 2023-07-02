# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning the db..."
UserWorkspace.destroy_all
Card.destroy_all
List.destroy_all
Project.destroy_all
Workspace.destroy_all
User.destroy_all

puts "Creating user..."
user = User.create(email: "lucca@test.com", password: "pass123")
puts "Created #{User.count} user(s) [email: lucca@test.com, password: pass123]"

puts "Creating Workspaces..."
workspace = Workspace.new(name: "Workspace")
user.workspaces << workspace
puts "Created #{Workspace.count} workspace(s)"

puts "Creating Projects..."
project = Project.new(name: "Project")
workspace.projects << project
puts "Created #{Project.count} project(s)"

puts "Creating Lists..."
todo = List.new(name: "To do")
doing = List.new(name: "Doing")
done = List.new(name: "Done")
project.lists << [todo, doing, done]
puts "Created #{List.count} list(s)"

puts "Creating Cards..."
car = Card.new(name: "Buy a car")
food = Card.new(name: "Cook some food")
job = Card.new(name: "Get a job", description: "Preferably a remote one")
todo.cards << [car, food, job]
puts "Created #{Card.count} card(s)"
