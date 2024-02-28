extends Area2D

@export_range(1.0, 1000.0, 1.0, "suffix: p/s")
var speed: float = 400

var screen_size: Vector2

@onready var player_sprite: Sprite2D = $PlayerSprite


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("move_down"):
		position.y += speed * delta
	if Input.is_action_pressed("move_up"):
		position.y -= speed * delta
	
	position = position.clamp(Vector2(position.x, player_sprite.texture.get_size().y / 2), 
		Vector2(position.x, screen_size.y - player_sprite.texture.get_size().y / 2))
