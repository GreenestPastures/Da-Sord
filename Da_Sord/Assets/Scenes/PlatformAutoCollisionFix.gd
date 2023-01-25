extends CollisionShape2D
var xBaseSize = 171
var yBaseSize = 30
onready var xScale = (get_parent().scale.y)
onready var yScale = (get_parent().scale.x)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	scale.x = 1
#	scale.y = 1
#	shape.extents = Vector2(xBaseSize*xScale,yBaseSize*yScale)
	
#	RectangleShape2D.x = float(xBaseSize*xScale)
#	RectangleShape2D.y = float(yBaseSize*yScale)
#set_extents(vector2(xBaseSize*xScale,yBaseSize*yScale))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
