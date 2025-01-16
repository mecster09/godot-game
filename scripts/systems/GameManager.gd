extends Node

signal score_changed(new_score: int)

var current_score: int = 0

func add_score(amount: int) -> void:
    current_score += amount
    score_changed.emit(current_score)

func reset_game() -> void:
    current_score = 0
    score_changed.emit(current_score)
    
    # Reload main scene
    get_tree().reload_current_scene() 