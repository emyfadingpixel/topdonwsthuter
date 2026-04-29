extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
# Direction vai se referir ao movimento do jogador
var direction = Vector2(0,0)

# Configura a cena que será usada para criar a bala
@export var projetil: PackedScene

# Importamos o nó EmissorBala de forma SEGURA com o onready, para capturar a posição do Emissor
@onready var ponta_arma = $EmissorBala
#@onready var som_tiro = $SomDoTiro

func _physics_process(delta: float) -> void:
	
	rotacionar_corpo()
	mover()
	
	move_and_slide()
	
	
# A função _input é usada para comandos que não são movimento, ou são complexos
func _input(event: InputEvent) -> void:
	# Verificar o tipo de ação que o jogador fez e aciona o mecanismo da ação
	if event.is_action_pressed("atirar"):
		disparar()
		
func disparar():
	# 1. Cria a bala
	var nova_bala = projetil.instantiate()
	
	# 2. Configura a bala (Posição, Direção e Rotação)
	nova_bala.global_position = ponta_arma.global_position
	
	# Usa o centro do jogador e a ponta da arma para gerar a direção do tiro
	nova_bala.direcao = (get_global_mouse_position() - self.global_position).normalized()
	
	nova_bala.look_at(get_global_mouse_position())
	
	# 3. Adiciona a bala na fase atual
	get_tree().current_scene.add_child(nova_bala)
	
	#som_tiro.play(1.0)
	#
	#await get_tree().create_timer(0.1).timeout
	#
	#som_tiro.stop()
	
	
	
func mover():
	
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = SPEED * direction
	
func rotacionar_corpo():
	look_at(get_global_mouse_position())
	
