extends Node2D

export var startPos = Vector2(0,0)

const UP = 0x1
const RIGHT = 0x2
const DOWN = 0x4
const LEFT = 0x8

export var cell_walls = {Vector2(0, -1): UP, Vector2(1, 0): RIGHT,
				  Vector2(0, 1): DOWN, Vector2(-1, 0): LEFT}
export (PackedScene) var ThrockMorton
export (Transform2D) var SpawnLoc
export (AudioStream) var musicTrack
var tile_size = 64  # tile size (in pixels)
export var width = 25  # width of map (in tiles)
export var height = 15  # height of map (in tiles)
export (Array, int) var TileZero = []
export (Array, int) var TileOne = []
export (Array, int) var TileTwo = []
export (Array, int) var TileThree = []
export (Array, int) var TileFour = []
export (Array, int) var TileFive = []
export (Array, int) var TileSix = []
export (Array, int) var TileSeven = []
export (Array, int) var TileEight = []
export (Array, int) var TileNine = []
export (Array, int) var TileTen = []
export (Array, int) var TileEleven = []
export (Array, int) var TileTwelve = []
export (Array, int) var TileThirteen = []
export (Array, int) var TileFourteen = []
onready var LevelLists = [TileZero, TileOne, TileTwo, TileThree, TileFour, TileFive, TileSix, TileSeven, TileEight, TileNine, TileTen, TileEleven, TileTwelve, TileThirteen, TileFourteen]



# get a reference to the map for convenience
onready var Map = $TileMap


func _ready():
	randomize()
	tile_size = Map.cell_size
	make_maze()
	$"/root/BackgroundMusic".stream = musicTrack
	$"/root/BackgroundMusic".play()


func check_neighbors(cell, unvisited):
	# returns an array of cell's unvisited neighbors
	var list = []
	for n in cell_walls.keys():
		if cell + n in unvisited:
			list.append(cell + n)
	return list
	
	
#Recall Previous Tile
#Check Stack tiles surrounding, ignore previous
#Current dir - selected dir
#Selected direction - cur dir

func make_maze():
	var unvisited = []  # array of unvisited tiles
	var stack = []
	# fill the map with solid tiles
	#Map.clear()
	for x in range(width):
		for y in range(height):
			unvisited.append(Vector2(x, y))
			if Map.get_cellv(Vector2(x,y)) < 0:
				Map.set_cellv(Vector2(x, y), UP|RIGHT|DOWN|LEFT)
	var current = Vector2(startPos.x-1, startPos.y-1)
#	var current = Vector2(randi() % int(startPos.x-1), randi() % int(startPos.y-1))
	unvisited.erase(current)
	while unvisited:
		var neighbors = check_neighbors(current, unvisited)
		var walls = check_neighbors(current, stack)
		if neighbors.size() > 0:
			var next = neighbors[randi() % neighbors.size()]
			if walls.size() > 2:
				var neighborino = cell_walls.keys()[randi() % cell_walls.size()]
				if Map.get_cellv(current) & cell_walls[neighborino]:
					var thisWalls = Map.get_cellv(current) - cell_walls[neighborino]
					var thatWalls = Map.get_cellv(current+neighborino) - cell_walls[-neighborino]
					Map.set_cellv(current, thisWalls)
					Map.set_cellv(current+neighborino, thatWalls)
			stack.append(current)
			# remove walls from *both* cells
			var dir = next - current
			var current_walls = Map.get_cellv(current) - cell_walls[dir]
			var next_walls = Map.get_cellv(next) - cell_walls[-dir]
			if Map.get_cellv(current) & cell_walls[dir]:
				Map.set_cellv(current, current_walls)
				Map.set_cellv(next, next_walls)
			current = next
			unvisited.erase(current)

#			print(cell_walls[dir])
			
		elif stack:
			current = stack.pop_back()
#		yield(get_tree(), 'idle_frame')
#		yield(get_tree().create_timer(0.2), "timeout")
	#LOOP TO SELECT LEVELS BASED ON TILENUM 0-15
	# CHECK TILENUM AND USE RANDOM ROOM FROM THAT NUMSET
	for x in range(width):
		for y in range(height):
			var curTile = Map.get_cellv(Vector2(x, y))
			var TilesList = LevelLists[curTile]
			Map.set_cellv(Vector2(x, y), TilesList[randi() % TilesList.size()])
#		yield(get_tree(), 'idle_frame')
			
			
	
#		var baby =ThrockMorton.instance()
#		baby.transform = SpawnLoc
#		add_child(baby)

