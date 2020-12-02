# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'Populando categorias --START'

Categoria.create(descricao: 'Cerveja', produtos_ids: [1, 2, 4])
Categoria.create(descricao: 'Vodka', produtos_ids: [7, 6, 3])
Categoria.create(descricao: 'Whisky', produtos_ids: [9, 40, 12])
Categoria.create(descricao: 'Refrigerantes', produtos_ids: [13, 24, 33])

p 'Populando categorias --END'