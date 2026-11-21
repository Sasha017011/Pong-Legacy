extends CharacterBody2D

@export var speed: float = 30000.0
@export var ai: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input
	if ai:
		var ball = get_parent().get_node("Ball")
		if ball.position.y < position.y:
			input = -1
		else:
			input = 1
	else:
		input = Input.get_axis("ui_up", "ui_down")
	velocity.y = input * speed * delta
	move_and_slide()
	position.y = clamp(position.y, 120, 528)
