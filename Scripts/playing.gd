extends Node2D

var score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass



func _on_ball_player_scored() -> void:
	score += 1
	$UI/Score.text = "Score: %s" % score


func _on_ball_enemy_scored() -> void:
	score -= 1
	$UI/Score.text = "Score: %s" % score
