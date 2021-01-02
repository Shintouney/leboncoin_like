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
]
categories.each{|categorie| Category.create! categorie}
add_subcategory "Emploi", ["Offres d'emploi", "Offres d'emploi Cadres", "Formations Professionnelles"]
add_subcategory "Véhicules", ["Voitures", "Motos", "Caravaning", "Utilitaires", "Camios", "Nautismes", "Equipement auto", "Equipement Moto", "Equipement caravaning", "Equipement Nautismes"]
add_subcategory "Immobilier", ["Ventes immobilières", "Immobilier Neuf", "Locations", "Colocations", "Bureaux & commerces"]
add_subcategory "Vacances", ["Locations & Gîtes", "Chambres d'hôtes", "Campings", "Hôtels", "Hébergements insolites", "Ventes privées vacances"]
add_subcategory "Loisir", ["DVD - Films", "CD - Musique", "Livres", "Vélos", "Sports & Hobbies", "Instruments de musique", "Collection", "Jeux & Jouets", "Vins & Gastronomie"]
