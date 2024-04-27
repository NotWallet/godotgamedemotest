extends Node2D



@onready var enemy = preload("res://Scenes/enemy.tscn")
@onready var enemy_script = preload("res://Scripts/enemy.gd")

@onready var player = $player

var rand = RandomNumberGenerator.new()



var wave = 1
var enemies = 5

var enemy_posX = [50,100,150,200,250,300,350,400,450]
var enemy_posY = [50,100,50,100,50,100,50,100,50]
var Xlistdupe
var Ylistdupe


var activeenemies = []

#var enemyspawnpresets = [[Vector2(50,50), Vector2(100,100),Vector2(150,50),Vector2(200,100),Vector2(250,50),Vector2(300,100),Vector2(350,50),Vector2(400,100),Vector2(450,50)]]
# Called when the node enters the scene tree for the first time.
func _ready():
	start_wave()
	#for i in range(len(enemy_posX)):
		#spawn_enemy(Vector2(enemy_posX[i],enemy_posY[i]))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func start_wave():
	if activeenemies.is_empty() != true:
		activeenemies.clear()
	Xlistdupe = enemy_posX.duplicate()
	Ylistdupe = enemy_posY.duplicate()
	for x in range(enemies):
		var randposx = Xlistdupe.pick_random()
		var randposy = Ylistdupe.pick_random()
		Xlistdupe.erase(randposx)
		Ylistdupe.erase(randposy)
		spawn_enemy(Vector2(randposx, randposy))

func spawn_enemy(pos):
	var new_enemy = enemy.instantiate()
	new_enemy.set_position(pos)
	new_enemy.set_script(enemy_script)
	add_child(new_enemy)
	activeenemies.append(new_enemy)
	


		
