extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
#Direcrtion vai se referir ao movimento do jogador
var direction = Vector2(0,0)


func _physics_process(delta: float) -> void:
	
	rotacionar_corpo()
	mover()
	
	move_and_slide()

func mover():
	direction = Input.get_vector("ui_left", "ui_right", "ui_up","ui_down")
	
	velocity = SPEED * direction
func rotacionar_corpo():
	look_at(get_global_mouse_position())
