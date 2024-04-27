extends Node2D

@onready var Bullets = get_node("/root/Main/Bullets")



var bulletspeed = 7.0


func _ready():

	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= bulletspeed
	
	if position.y < -700:
		queue_free()



func _on_area_body_entered(body):
		queue_free()
		if body.has_method("die"):
			body.die()
