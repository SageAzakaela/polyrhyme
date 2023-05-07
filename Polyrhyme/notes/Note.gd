extends Sprite

onready var game_timer = get_node("../../Timer")
onready var game = get_node("../..")

var can_press = false
var score = 1000
var note_color = ""
var beat_number = 0


func _process(delta):
	if game.beat_number >= beat_number - 20:
		var progress = game_timer.time_left / (game_timer.wait_time)
		var distance_to_target = 475 - global_position.y
		var speed = (distance_to_target / 8) / game_timer.wait_time 
		
		# Slow down the note as it approaches the target point
		if progress < 0.95:
			speed *= 0.50
		
		global_position.y += (speed * delta) + 1
		if global_position.y >= 475:
			queue_free()


	if can_press == true:
		if Input.is_action_just_pressed("red") and note_color == "red":
			game.current_score += score
			queue_free()
		elif Input.is_action_just_pressed("yellow") and note_color == "yellow":
			game.current_score += score
			queue_free()
		elif Input.is_action_just_pressed("green") and note_color == "green":
			game.current_score += score
			queue_free()
		elif Input.is_action_just_pressed("blue") and note_color == "blue":
			game.current_score += score
			queue_free()


func _on_Hitbox_area_entered(area):
	if area.is_in_group("target"):
		can_press = true
		$ScoreTimer.start()


func _on_ScoreTimer_timeout():
	score -= 100
