extends Area2D

signal player_scored
signal enemy_scored

@export_range(1.0, 1000.0, 1.0, "suffix: p/s")
var speed: float = 200

@export_range(1.0, 1000.0, 1.0, "suffix: p/s")
var max_ball_speed: float = 1000.0

@export_range(1.0, 50.0, 1.0, "suffix: p/s")
var speed_increment: float = 5.0

var screen_height: float
var direction: Vector2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_height = get_viewport_rect().size.y
	direction = Vector2(-1.0, 0.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * (speed * delta)
	
	if position.y <= 0 || position.y >= screen_height:
		direction.y *= -1


func _on_player_area_entered(area: Area2D) -> void:
	if speed + speed_increment < max_ball_speed:
		speed += speed_increment
	print(speed)
	direction.y = randf_range(-1.0, 1.0)
	direction.x *= -1


func _on_enemy_paddle_area_entered(area: Area2D) -> void:
	if speed + speed_increment < 1000.0:
		speed += speed_increment
	print(speed)
	direction.y = randf_range(-1.0, 1.0)
	direction.x *= -1


func _on_player_score_area_area_entered(area: Area2D) -> void:
	emit_signal("player_scored")
	direction = Vector2(1.0, 0.0)
	_restart_position()


func _restart_position() -> void:
	position = Vector2(400, 300)
	speed = 200


func _on_enemy_score_area_area_entered(area: Area2D) -> void:
	emit_signal("enemy_scored")
	direction = Vector2(-1.0, 0.0)
	_restart_position()
