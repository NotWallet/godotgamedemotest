extends CharacterBody2D

var bullet = preload("res://Scenes/bullet2.tscn")
@onready var Bullets = get_node("/root/Main/Bullets/")
@onready var Main = get_node("/root/Main/")

#Game Variables
var PLAYERSPEED = 100.0 #how fast the player can travel
var BULLETSPEED = 5.0 #how fast bullets will travel
var BULLETCDT = 1.5 #bullet cooldown time
var BULLETCD = false #bullet cooldown





func _ready():
	position = Vector2(250,609)



func spawn_bullet():
	
		var new_bullet = bullet.instantiate()
		new_bullet.bulletspeed = BULLETSPEED
		Main.add_child(new_bullet)
		new_bullet.set_position(self.position)
		#new_bullet.set_script(bullet_script)
	

func _unhandled_input(event):
	if (event is InputEventMouseButton && event.is_action_pressed("shoot")):
		spawn_bullet()



func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var Xdirection = Input.get_axis("left", "right")
	if Xdirection:
		velocity.x = Xdirection * PLAYERSPEED
	else:
		velocity.x = move_toward(velocity.x, 0, PLAYERSPEED)
		
	var Ydirection = Input.get_axis("up", "down")
	if Ydirection:
		velocity.y = Ydirection * PLAYERSPEED
	else:
		velocity.y = move_toward(velocity.y, 0, PLAYERSPEED)
	
	if position.x < 0:
		position.x = 0
	if position.y < 0:
		position.y = 0
	if position.x > 500:
		position.x = 500
	if position.y > 750:
		position.y = 750

	move_and_slide()
