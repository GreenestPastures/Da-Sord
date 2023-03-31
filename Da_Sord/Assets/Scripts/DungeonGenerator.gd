extends Node2D

const Up = 0x1
const Right = 0x2
const Down = 0x4
const Left = 0x8

export var cell_walls = {Vector2(0, -1): Up, Vector2(1, 0): Right,
				  Vector2(0, 1): Down, Vector2(-1, 0): Left}

var tile_size = 64  # tile size (in pixels)
export var width = 25  # width of map (in tiles)
export var height = 15  # height of map (in tiles)

# get a reference to the map for convenience
onready var Map = $TileMap


func _ready():
	randomize()
	tile_size = Map.cell_size
	make_maze()


func check_neighbors(cell, unvisited):
	# returns an array of cell's unvisited neighbors
	var list = []
	for n in cell_walls.keys():
		if cell + n in unvisited && Map.get_cellv(cell) - cell_walls[n] > 0 && Map.get_cellv(cell) - cell_walls[n] < 16:
#			print(Map.get_cellv(cell), cell_walls[n])
			list.append(cell + n)
	return list
	
	
#Recall Previous Tile
#Check Stack tiles surrounding, ignore previous
#Current dir - selected dir
#Selected direction - cur dir

func make_maze():
	var unvisited = []  # array of unvisited tiles
	var stack = []
	var wallHavers = []
	# fill the map with solid tiles
	Map.clear()
	for x in range(width):
		for y in range(height):
			unvisited.append(Vector2(x, y))
			Map.set_cellv(Vector2(x, y), Up|Right|Down|Left)
	var current = Vector2(0, 0)
	unvisited.erase(current)
	while unvisited:
		var neighbors = check_neighbors(current, unvisited)
		var walls = check_neighbors(current, wallHavers)
		if neighbors.size() > 0:
			var next = neighbors[randi() % neighbors.size()]
			#erase previous before check // Remove extra from WallHavers
			if walls.size() > 2:
				var newHole = walls[randi() % walls.size()]
				var dir2 = newHole - current
				var current_walls2 = Map.get_cellv(current) - cell_walls[dir2]
				var next_walls2 = Map.get_cellv(newHole) - cell_walls[-dir2]
				print(current, ", ", Map.get_cellv(current), ", ", dir2)
#				print(current, ", ", current_walls2, ", ", dir2)
#				print(newHole, ", ", next_walls2, ", ", dir2)
				Map.set_cellv(current, current_walls2)
				Map.set_cellv(newHole, next_walls2)
				
			stack.append(current)
			# remove walls from *both* cells
			var dir = next - current
			var current_walls = Map.get_cellv(current) - cell_walls[dir]
			var next_walls = Map.get_cellv(next) - cell_walls[-dir]
			Map.set_cellv(current, current_walls)
			Map.set_cellv(next, next_walls)
			current = next
			unvisited.erase(current)
			wallHavers.append(stack.back())
			print(cell_walls[dir])
			
		elif stack:
			current = stack.pop_back()
		yield(get_tree(), 'idle_frame')
#		yield(get_tree().create_timer(0.2), "timeout")

