extends CharacterBody2D

@export var speed = 100

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

#position是人物的位置坐标
var target = position

var tiaoshi = 50

func _input(event):
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			target = get_global_mouse_position()
#get_global_mouse_position()是鼠标吧位置坐标

func _physics_process(delta):
	
	#position.direction_to(target) * speed是人到鼠标坐标的向量
	velocity = position.direction_to(target) * speed
	
	#分离向量的X和Y值
	var right_x = velocity.x
	var left_y = velocity.y
	
	
	print(right_x,"   ",left_y)
	
	if position.distance_to(target) > 3:
		
		if left_y < tiaoshi && left_y > -tiaoshi:
			if right_x > 0:
				animated_sprite.play("run")
				animated_sprite.flip_h = false
				move_and_slide()
			else :
				animated_sprite.play("run")
				animated_sprite.flip_h = true
				move_and_slide()
	
	
		if right_x < tiaoshi && right_x > -tiaoshi:
			if left_y > 0:
				animated_sprite.play("up")
				move_and_slide()
			else :
				animated_sprite.play("down")
				move_and_slide()
	
	else :
		animated_sprite.play("idele")
	
