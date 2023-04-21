extends Button

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	$Label.connect("resized", self, "_on_Label_resized")



func _physics_process(delta):
	rect_size.y = $Label.rect_size.y
	
