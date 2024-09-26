package controllers

import (
	"log"
	"net/http"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"

	"Gin/Hello/models"
)

var db *gorm.DB

func Setup(database *gorm.DB) {
	db = database
}

// DEFAULT
func Index(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"message": "Hello World",
	})
}

// POST
func CreateSurfSpot(c *gin.Context) {
	var surfspot models.SurfSpots
	if err := c.ShouldBindJSON(&surfspot); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		log.Printf("Error: %v", err)
		return
	}
	if err := db.Create(&surfspot).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	c.JSON(http.StatusCreated, surfspot)
}

// GET one
func GetSurfSpot(c *gin.Context) {
	id := c.Param("id")
	var surfspot models.SurfSpots
	if err := db.First(&surfspot, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "SurfSpot not found"})
		log.Printf("Error: %v", err)
		return
	}
	c.JSON(http.StatusOK, surfspot)
}

// GET all
func GetSurfSpots(c *gin.Context) {
	var surfspots []models.SurfSpots
	if err := db.Find(&surfspots).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		log.Printf("Error: %v", err)
		return
	}
	c.JSON(http.StatusOK, surfspots)
}

// PUT
func UpdateSurfSpot(c *gin.Context) {
	id := c.Param("id")
	var surfspot models.SurfSpots
	if err := db.First(&surfspot, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "surfspot not found"})
		log.Printf("Error: %v", err)
		return
	}
	if err := c.ShouldBindJSON(&surfspot); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		log.Printf("Error: %v", err)
		return
	}
	if err := db.Save(&surfspot).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		log.Printf("Error: %v", err)
		return
	}
	c.JSON(http.StatusOK, surfspot)
}

// DELETE
func DeleteSurfSpot(c *gin.Context) {
	id := c.Param("id")
	if err := db.Delete(&models.SurfSpots{}, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "SurfSpot not found"})
		log.Printf("Error: %v", err)
		return
	}
	c.JSON(http.StatusNoContent, nil)
}