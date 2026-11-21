extends CharacterBody2D

@onready var pong_ball: AudioStreamPlayer = $"../PongBall"
@onready var pong_paddle: AudioStreamPlayer = $"../PongPaddle"
@onready var pong_score: AudioStreamPlayer = $"../PongScore"

var starting_direction: Vector2
var starting_directions = [Vector2(-1, -1), Vector2(1, 1), Vector2(1, -1), Vector2(-1, 1),]
var starting_speed: float = 300.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	starting_direction = starting_directions.pick_random()
	velocity = starting_direction * starting_speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		var normal = collision.get_normal()
		velocity = bounce(normal)
		velocity *= 1.1
		pong_paddle.play()
	if position.y < 0:
		velocity = bounce(Vector2.DOWN)
		pong_ball.play()
	elif position.y > 648:
		velocity = bounce(Vector2.UP)
		pong_ball.play()
	if position.x < 0:
		Globals.player_2_score += 1
		pong_score.play()
		get_tree().reload_current_scene()
	elif position.x > 1152:
		Globals.player_1_score += 1
		pong_score.play()
		get_tree().reload_current_scene()

func bounce(normal: Vector2) -> Vector2:
	return velocity.bounce(normal)
