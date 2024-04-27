extends CharacterBody2D

var health = 100

@onready var text = $TextEdit
@onready var Main = get_node("/root/Main/")

func _ready():
	pass

func _physics_process(delta):

	position.y += .25
	text.text = str(health)
	
func die():
	health-=25
	
	if health <= 0:
		Main.activeenemies.erase(self)
		if Main.activeenemies.is_empty() == true:
			Main.start_wave()
		queue_free()

		

