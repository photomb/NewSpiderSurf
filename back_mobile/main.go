package main

import (
	"log"
	"github.com/gin-gonic/gin"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"

	"Gin/Hello/routes"
	"Gin/Hello/models"
	"Gin/Hello/controllers"

)


//db configuration
const (
	supabaseURL = "https://ndddvekurmyupugqbrst.supabase.co/"
	supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5kZGR2ZWt1cm15dXB1Z3FicnN0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjEzOTQzNDgsImV4cCI6MjAzNjk3MDM0OH0.mQDyq7eArIEANKhUeYzuWP01rGI-kh_Jv_Pc6J3mpRg"
	databaseURL = "postgresql://postgres.ndddvekurmyupugqbrst:hTWd9OuTC86brAcE@aws-0-eu-central-1.pooler.supabase.com:5432/postgres"
)

func main() {
	var err error

	// Connexion à la base de données
	db, err := gorm.Open(postgres.Open(databaseURL), &gorm.Config{})
	if err != nil {
		log.Fatalf("Database connexion error: %v", err)
	}

	// Migration des tables
	db.AutoMigrate(&models.SurfSpots{})

	// Passer l'instance de la base de données au contrôleur
	controllers.Setup(db)

	// Initialisation de Gin
	router := gin.Default()

	// Configuration des routes
	routes.SetupSurfSpots(router, db)

	// Lancer le serveur
	router.Run(":8080")
}