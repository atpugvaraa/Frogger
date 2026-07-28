extends Node2D

var carScene: PackedScene = preload("res://scenes/car.tscn")

func _on_finish_area_2d_body_entered(body: Node2D) -> void:
	print(body, " ", "has entered")


func _on_car_timer_timeout() -> void:
	var car = carScene.instantiate() as Area2D
	var posMarker = $CarStartPositions.get_children().pick_random() as Marker2D
	car.position = posMarker.position
	$Objects.add_child(car)
	car.connect("body_entered", go_to_title)

func go_to_title(body):
	print("player car collision")