extends Node
var päkkapikke = 0
var kollaseidpäkkapikke = 0
var siniseidpäkkapikke = 0
var rohelisipäkkapikke = 0

var rng = RandomNumberGenerator.new()

var mesi = 0
var jook = 0
var vesi = 0
var lapinkulta = 0
var viht1 = 0
var viht2 = 0
var viht3 = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func muuda(punaseid,kollaseid, siniseid, rohelisi, mee, joo, vee, lapin, viht11, viht22, viht33):
	päkkapikke = punaseid
	kollaseidpäkkapikke = kollaseid
	siniseidpäkkapikke = siniseid
	rohelisipäkkapikke = rohelisi
	mesi = mee
	jook = joo
	vesi = vee
	lapinkulta = lapin
	viht1 = viht11
	viht2 = viht22
	viht3 = viht33
