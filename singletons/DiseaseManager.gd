extends Node


var disease_scene = preload("res://scenes/miscs/Disease.tscn")

const Diseases = {
	
	"CommonCold": {
		"contagion_range": 0.0,
		"incubation_time": 0.0,
		"incubation_contagion": false,
		"symptomatic_time": 0.0,
		"symptomatic_contagion": true,
		"r0": 2,
		"letality": 0.1
	},
	"Flu": {
		"contagion_range": 0.0,
		"incubation_time": 0.0,
		"incubation_contagion": true,
		"symptomatic_time": 0.0,
		"symptomatic_contagion": false,
		"r0": 2.5,
		"letality": 0.1
	},
	"Measles": {
		"contagion_range": 0.0,
		"incubation_time": 0.0,
		"incubation_contagion": true,
		"symptomatic_time": 0.0,
		"symptomatic_contagion": true,
		"r0": 12,
		"letality": 0.1
	}
	
}


func create_disease(name: String) -> Disease:
	
	if not Diseases.has(name):
		return null
	
	var disease = disease_scene.instance()
	
	disease.contagion_radius = Diseases[name].contagion_range
	disease.incubation_time = Diseases[name].incubation_time
	disease.incubation_contagion = Diseases[name].incubation_contagion
	disease.symptomatic_time = Diseases[name].symptomatic_time
	disease.symptomatic_contagion = Diseases[name].symptomatic_contagion
	disease.letality = Diseases[name].letality
	
	return disease
	
