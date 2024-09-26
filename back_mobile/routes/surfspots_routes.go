package routes

import (
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"

	"Gin/Hello/controllers"
)

// Setup
func SetupSurfSpots(router *gin.Engine, db *gorm.DB) {
	controllers.Setup(db)
	router.GET("/", controllers.Index)
	router.GET("/surfspots", controllers.GetSurfSpots)
	router.GET("/surfspots/:id", controllers.GetSurfSpot)
	router.POST("/surfspots", controllers.CreateSurfSpot)
	router.PUT("/surfspots/:id", controllers.UpdateSurfSpot)
	router.DELETE("/surfspots/:id", controllers.DeleteSurfSpot)
}