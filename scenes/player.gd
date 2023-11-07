extends CharacterBody2D

@export var initialSpeed = 200

var speed = 200
var sneakPenalty = 2

var isMoving = false;
var isCrouching = false;
var isRunning = false;

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	if (velocity.x || velocity.y):
		isMoving = true;
		$AnimationPlayer.play("walking");
		
	else:
		isMoving = false;
		$AnimationPlayer.play("idle");
		
func Running():
	if (Input.is_action_pressed("run")):
		$AnimationPlayer.speed_scale = 2
		isRunning = true;
		speed = 400
	else:
		speed = initialSpeed
		isRunning = false
		$AnimationPlayer.speed_scale = 1

func pressedCrouch():
	if (Input.is_action_just_pressed("crouch") && !isCrouching):
		isCrouching = true;
		$crouch.visible = true;
		$idle.visible = false;
		speed = speed / sneakPenalty;
		$AudioStreamPlayer.volume_db = -20;
		
	elif (Input.is_action_just_pressed("crouch") && isCrouching):
		isCrouching = false;
		$crouch.visible = false;
		$idle.visible = true;
		$AudioStreamPlayer.volume_db = 0;
		speed = initialSpeed;

func _physics_process(_delta):
	get_input()
	move_and_slide()
	pressedCrouch()
	Running()
	


func _on_timer_timeout():
	if ((velocity.x || velocity.y) && !isRunning):
		$AudioStreamPlayer.pitch_scale = 1 * randf_range(0.8, 1.5);
		$AudioStreamPlayer.play();
	elif ((velocity.x || velocity.y) && isRunning):
		$AudioStreamPlayer.pitch_scale = 1 * randf_range(2, 3);
		$AudioStreamPlayer.play();
	
