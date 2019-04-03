extends Node2D

onready var animation = $Animation

var center
var offset
var game
var right = true #true because as defalt our player on the right side of the screen

func _ready():
	game = get_parent()
	center = get_viewport_rect().size.x / 2 #center of the screen
	offset = abs(position.x - center)
	
func _input(event):
	#if mouse clicked or screen touched
	if (event is InputEventMouseButton or event is InputEventScreenTouch) and event.is_pressed():
		
		if event.position.x < center: #if player is on the left side of the screen
			position.x = center - offset
			scale.x = -abs(scale.x)
			right = false
		else:
			position.x = center + offset
			scale.x = abs(scale.x)
			right = true
			
		animation.play("punch")
		game.punch_tree(right)



















