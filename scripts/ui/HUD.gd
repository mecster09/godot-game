extends Control

@onready var health_label: Label = $HealthLabel
@onready var score_label: Label = $ScoreLabel

func _ready() -> void:
    # Connect to player health changes
    var player = get_tree().get_first_node_in_group("player")
    if player:
        player.health_changed.connect(_on_player_health_changed)
    
    # Connect to score changes
    GameManager.score_changed.connect(_on_score_changed)

func _on_player_health_changed(new_health: int) -> void:
    health_label.text = "Health: %d" % new_health

func _on_score_changed(new_score: int) -> void:
    score_label.text = "Score: %d" % new_score 