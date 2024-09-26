package models

type SurfSpots struct {
	ID      	uint    `json:"id" gorm:"primary_key"`
	Name    	string 	`json:"name"`
	Image		string 	`json:"image"`
	City 		string 	`json:"city"`
	Latitude  	float64 `json:"latitude"`
	Longitude 	float64 `json:"longitude"`
	Risk 		string 	`json:"risk"`
	Weather 	string 	`json:"weather"`
	Temp 		int8 	`json:"temp"`
	Tide 		string 	`json:"tide"`
	Coeff 		int8 	`json:"coeff"`
	Swellsea 	string 	`json:"swell_sea"`
	Wind 		string 	`json:"wind"`
	Description string 	`json:"description"`
}