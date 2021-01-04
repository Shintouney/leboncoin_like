# Creating categories
def add_subcategory name, array
	cat = Category.find_by_name(name)
	array.each do |item|
		Category.create! name: item, parent_id: cat.id
	end
end

categories = [
  { name: "Emploi" },
  { name: "Véhicules" },
  { name: "Immobilier" },
  { name: "Vacances" },
  { name: "Loisir" },
  { name: "Animaux" },
  { name: "Mode" },
  { name: "Multimédia" },
  { name: "Services" },
  { name: "Maison" },
  { name: "Matérielle Professionelles" },
  { name: "Divers" },
]
categories.each{|categorie| Category.create! categorie}
add_subcategory "Emploi", ["Offres d'emploi", "Offres d'emploi Cadres", "Formations Professionnelles"]
add_subcategory "Véhicules", ["Voitures", "Motos", "Caravaning", "Utilitaires", "Camios", "Nautismes", "Equipement auto", "Equipement Moto", "Equipement caravaning", "Equipement Nautismes"]
add_subcategory "Immobilier", ["Ventes immobilières", "Immobilier Neuf", "Locations", "Colocations", "Bureaux & commerces"]
add_subcategory "Vacances", ["Locations & Gîtes", "Chambres d'hôtes", "Campings", "Hôtels", "Hébergements insolites", "Ventes privées vacances"]
add_subcategory "Loisir", ["DVD - Films", "CD - Musique", "Livres", "Vélos", "Sports & Hobbies", "Instruments de musique", "Collection", "Jeux & Jouets", "Vins & Gastronomie"]
add_subcategory "Animaux", ["Animaux"]
add_subcategory "Mode", ["Vêtements", "Chaussures", "Accessoires & Bagagerie", "Montres & Bijoux", "Équipement bébé", "Vêtements bébé", "Luxe et Tendance"]
add_subcategory "Multimédia", ["Informatique", "Consoles & Jeux vidéo", "Image & Son", "Téléphonie"]
add_subcategory "Services", ["Prestations de services", "Billetterie", "Évènements", "Cours particuliers", "Covoiturage"]
add_subcategory "Maison", ["Ameublement", "Électroménager", "Arts de la table", "Décoration", "Linge de maison", "Bricolage", "Jardinage"]
add_subcategory "Matérielle Professionelles", ["Matériel agricole", "Transport - Manutention", "BTP - Chantier gros-oeuvre", "Outillage - Matériaux 2nd-oeuvre", "Équipements industriels", "Restauration - Hôtellerie", "Fournitures de bureau", "Commerces & Marchés", "Matériel médical"]
add_subcategory "Divers", ["Autres"]

# Creating user
user                       = User.new
user.email                 = 'test@example.com'
user.password              = 'riveton'
user.password_confirmation = 'riveton'
user.save!

Category.all.each do |category|
  5.times do
    offer = Offer.create \
      title: Faker::Vehicle.make,
      user_id: user.id,
      description: Faker::Lorem.sentences(number: 1, supplemental: true),
      price: 42,
      category_id: category.id,
      location: Faker::Address.city
    offer.cover_picture.attach(io: File.open(Rails.root.join("app", "assets", "images", "default.jpg")), filename: 'default.jpg' , content_type: "image/jpg")
    offer.save
  end
end
