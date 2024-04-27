extends Area2D

@onready var Bullets = get_node("/root/Main/Bullets")
@onready var parent = get_parent().get_parent()





var bulletspeed = 7.0


func _ready():
	#if parent.name != "Main":
		#bulletspeed = parent.BULLETSPEED
	Bullets.add_child(self)
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= bulletspeed
	
	if position.y < -700:
		queue_free()
	
func _on_body_entered(body):
	queue_free()
	if body.has_method("die"):
		body.die()
