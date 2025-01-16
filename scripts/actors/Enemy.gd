extends CharacterBody2D

const SPEED: float = 150.0
const DAMAGE: int = 10
const DETECTION_RANGE: float = 200.0

var player: Node2D = null

func _ready() -> void:
    # Find player node
    player = get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
    if player == null:
        return
        
    var distance := global_position.distance_to(player.global_position)
    
    if distance < DETECTION_RANGE:
        var direction := global_position.direction_to(player.global_position)
        velocity = direction * SPEED
        move_and_slide()

func _on_hitbox_body_entered(body: Node2D) -> void:
    if body.is_in_group("player") and body.has_method("take_damage"):
        body.take_damage(DAMAGE) 