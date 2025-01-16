extends CharacterBody2D

signal health_changed(new_health: int)

const SPEED: float = 300.0
const MAX_HEALTH: int = 100

var current_health: int = MAX_HEALTH

func _physics_process(delta: float) -> void:
    # Get input direction
    var direction := Vector2.ZERO
    direction.x = Input.get_axis("ui_left", "ui_right")
    direction.y = Input.get_axis("ui_up", "ui_down")
    direction = direction.normalized()
    
    # Set velocity and move
    velocity = direction * SPEED
    move_and_slide()

func take_damage(amount: int) -> void:
    current_health = max(0, current_health - amount)
    health_changed.emit(current_health)
    
    if current_health <= 0:
        die()

func die() -> void:
    # Implement death behavior
    queue_free() 