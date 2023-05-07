extends Control

onready var targets = $Targets
onready var red_diamond = $Targets/RedDiamond
onready var yellow_diamond = $Targets/YellowDiamond
onready var green_diamond = $Targets/GreenDiamond
onready var blue_diamond = $Targets/BlueDiamond
onready var notes = $Notes
onready var score = $Score
onready var timer = $Timer

var red_note = preload("res://notes/RedNote.tscn")
var yellow_note = preload("res://notes/YellowNote.tscn")
var green_note = preload("res://notes/GreenNote.tscn")
var blue_note = preload("res://notes/BlueNote.tscn")

var beat_modifier = 1
var beat_number = 0
var current_score = 0

var recording = false
var recorded_data = []

func _process(delta):
	if $SongChoosifier.visible == false:
		score.visible = true
		score.text = current_score as String
	else:
		score.visible = false
	if recording == true:
		if Input.is_action_pressed("red"):
			$Targets/RedDiamond/Full.visible = true
		else:
			$Targets/RedDiamond/Full.visible = false
		if Input.is_action_pressed("yellow"):
			$Targets/YellowDiamond/Full.visible = true
		else:
			$Targets/YellowDiamond/Full.visible = false
		if Input.is_action_pressed("green"):
			$Targets/GreenDiamond/Full.visible = true
		else:
			$Targets/GreenDiamond/Full.visible = false
		if Input.is_action_pressed("blue"):
			$Targets/BlueDiamond/Full.visible = true
		else:
			$Targets/BlueDiamond/Full.visible = false
		if Input.is_action_just_pressed("red"):
			recorded_data.append({
				beat_number: "red"
			})
		if Input.is_action_just_pressed("yellow"):
			recorded_data.append({
				beat_number: "yellow"
			})
		if Input.is_action_just_pressed("green"):
			recorded_data.append({
				beat_number: "green"
			})
		if Input.is_action_just_pressed("blue"):
			$Targets/BlueDiamond/Full.visible = true
			recorded_data.append({
				beat_number: "blue"
			})
	else:
		if Input.is_action_pressed("red"):
			$Targets/RedDiamond/Full.visible = true
		else:
			$Targets/RedDiamond/Full.visible = false
		if Input.is_action_pressed("yellow"):
			$Targets/YellowDiamond/Full.visible = true
		else:
			$Targets/YellowDiamond/Full.visible = false
		if Input.is_action_pressed("green"):
			$Targets/GreenDiamond/Full.visible = true
		else:
			$Targets/GreenDiamond/Full.visible = false
		if Input.is_action_pressed("blue"):
			$Targets/BlueDiamond/Full.visible = true
		else:
			$Targets/BlueDiamond/Full.visible = false
			


func _on_Song1_pressed():
	load_recorded_data("song_1")
	$SongChoosifier.visible = false
	$SongName.text = "Temple of Ice"
	beat_modifier = 0.4348 / 8 #138 BPM
	timer.wait_time = beat_modifier
	yield(get_tree(), "idle_frame")
	beat_number = 0
	timer.start()
	$Song1.play()

func _on_Song2_pressed():
	load_recorded_data("song_2")
	$SongChoosifier.visible = false
	$SongName.text = "Nitro"
	beat_modifier = 0.4 / 8 #150 BPM
	timer.wait_time = beat_modifier
	yield(get_tree(), "idle_frame")
	beat_number = 0
	timer.start()
	$Song2.play()
	
func _on_Song3_pressed():
	load_recorded_data("song_3")
	$SongChoosifier.visible = false
	$SongName.text = "Leave None Behind"
	beat_modifier = 0.5 / 8 #120 BPM
	timer.wait_time = beat_modifier
	yield(get_tree(), "idle_frame")
	beat_number = 0
	timer.start()	
	$Song3.play()

func _on_Song4_pressed():
	load_recorded_data("song_4")
	$SongChoosifier.visible = false
	$SongName.text = "Overdream"
	beat_modifier = 0.6 / 8 #100 BPM
	yield(get_tree(), "idle_frame")
	timer.wait_time = beat_modifier
	beat_number = 0
	timer.start()
	$Song4.play()


func _on_Song5_pressed():
	load_recorded_data("song_5")
	$SongChoosifier.visible = false
	$SongName.text = "Roll the Dice"
	beat_modifier = 0.4545 / 8 #132 BPM
	# Wait for a frame to ensure all notes are spawned
	yield(get_tree(), "idle_frame")
	
	timer.wait_time = beat_modifier
	$Song5.play()
	beat_number = 0
	timer.start()




func _on_Song6_pressed():
	load_recorded_data("song_6")
	$SongChoosifier.visible = false
	$SongName.text = "Aexplosive"
	beat_modifier = 0.6667 / 8 #90 BPM
	# Wait for a frame to ensure all notes are spawned
	yield(get_tree(), "idle_frame")
	
	timer.wait_time = beat_modifier
	$Song6.play()
	beat_number = 0
	timer.start()


func _on_Song7_pressed():
	load_recorded_data("song_7")
	$SongChoosifier.visible = false
	$SongName.text = "Champion of Salt"
	beat_modifier = 0.4724 / 8 #127 BPM
	# Wait for a frame to ensure all notes are spawned
	yield(get_tree(), "idle_frame")
	
	timer.wait_time = beat_modifier
	$Song7.play()
	beat_number = 0
	timer.start()

func _on_Hitbox_area_exited(area):
	area.get_parent().queue_free()
	current_score -= 100
	

func _on_RecordSong1_pressed():
	$SongChoosifier.visible = false
	$Song1.play()
	$SongName.text = "Temple of Ice"
	beat_modifier = 0.4348 / 8 #138 BPM
	timer.wait_time = beat_modifier
	timer.start()
	recording = true
	beat_number = 0


func _on_RecordSong2_pressed():
	$SongChoosifier.visible = false
	$Song2.play()
	$SongName.text = "Nitro"
	beat_modifier = 0.4 / 8 #150BPM
	timer.wait_time = beat_modifier
	yield(get_tree(), "idle_frame")
	timer.start()
	recording = true
	beat_number = 0


func _on_RecordSong3_pressed():
	$SongChoosifier.visible = false
	$Song3.play()
	$SongName.text = "Leave None Behind"
	beat_modifier = 0.5 / 8 #120 BPM
	timer.wait_time = beat_modifier
	yield(get_tree(), "idle_frame")
	timer.start()
	recording = true
	beat_number = 0


func _on_RecordSong4_pressed():
	$SongChoosifier.visible = false
	$Song4.play()
	$SongName.text = "Overdream"
	beat_modifier = 0.6 / 8 #100 BPM
	timer.wait_time = beat_modifier
	yield(get_tree(), "idle_frame")
	timer.start()
	recording = true
	beat_number = 0


func _on_RecordSong5_pressed():
	$SongChoosifier.visible = false
	$Song5.play()
	$SongName.text = "Roll the Dice"
	beat_modifier = 0.4545 / 8 #132 BPM
	timer.wait_time = beat_modifier
	yield(get_tree(), "idle_frame")
	timer.start()
	recording = true
	beat_number = 0

func _on_RecordSong6_pressed():
	$SongChoosifier.visible = false
	$Song6.play()
	$SongName.text = "Aexplosive"
	beat_modifier = 0.6667 / 8 #90 BPM
	timer.wait_time = beat_modifier
	yield(get_tree(), "idle_frame")
	timer.start()
	recording = true
	beat_number = 0

func _on_RecordSong7_pressed():
	$SongChoosifier.visible = false
	$Song7.play()
	$SongName.text = "Champion of Salt"
	beat_modifier = 0.4724 / 8 #127 BPM
	timer.wait_time = beat_modifier
	yield(get_tree(), "idle_frame")
	timer.start()
	recording = true
	beat_number = 0


func _on_Song1_finished():
	if recording == true:
		recording = false
		save_recorded_data("song_1")
	$SongChoosifier.visible = true

func _on_Song2_finished():
	if recording == true:
		recording = false
		save_recorded_data("song_2")
	$SongChoosifier.visible = true
	

func _on_Song3_finished():
	if recording == true:
		recording = false
		save_recorded_data("song_3")
	$SongChoosifier.visible = true

func _on_Song4_finished():
	if recording == true:
		recording = false
		save_recorded_data("song_4")
	$SongChoosifier.visible = true
		

func _on_Song5_finished():
	if recording == true:
		recording = false
		save_recorded_data("song_5")
	$SongChoosifier.visible = true

func _on_Song6_finished():
	if recording == true:
		recording = false
		save_recorded_data("song_6")
	$SongChoosifier.visible = true
	
func _on_Song7_finished():
	if recording == true:
		recording = false
		save_recorded_data("song_7")
	$SongChoosifier.visible = true


func _on_Timer_timeout():
	beat_number += 1


func save_recorded_data(filename):
	var json_str = JSON.print(recorded_data)
	var file = File.new()
	file.open("res://" + filename + ".json", File.WRITE)
	file.store_string(json_str)
	file.close()

func load_recorded_data(filename):
	var file = File.new()
	if file.file_exists("res://" + filename + ".json"):
		file.open("res://" + filename + ".json", File.READ)
		var json_str = file.get_as_text()
		var loaded_data = JSON.parse(json_str).result # convert to array
		file.close()

		for data in loaded_data:
			var beat_number = data.keys()[0]  # get the first (and only) key
			var color = data[beat_number]     # get the value associated with the key

			var note = null
			if color == "red":
				note = red_note.instance()
				note.note_color = "red"
			elif color == "yellow":
				note = yellow_note.instance()
				note.note_color = "yellow"
			elif color == "green":
				note = green_note.instance()
				note.note_color = "green"
			elif color == "blue":
				note = blue_note.instance()
				note.note_color = "blue"

			if note != null:
				note.beat_number = int(beat_number)
				notes.add_child(note)






