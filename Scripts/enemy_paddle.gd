extends Area2D

@export_range(1.0, 1000.0, 1.0, "suffix: p/s")
var speed: float = 400

@onready var ball: Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ball = $"../Ball"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ball.position.y > position.y:
		position.y += speed * delta
	if ball.position.y < position.y:
		position.y -= speed * delta
