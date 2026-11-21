extends CanvasLayer

@onready var player_1_score: Label = $Player1_Score
@onready var player_2_score: Label = $Player2_Score

func _process(delta: float) -> void:
	player_1_score.text = str(Globals.player_1_score)
	player_2_score.text = str(Globals.player_2_score)
