extends CharacterBody2D

@export var speed := 50
#@onready var animation_player: AnimationPlayer = $AnimationPlayer
#引入动画树节点
@onready var animation_tree: AnimationTree = $AnimationTree

#动画树切换条件
var is_running := false
#定义变量
var target = position


#主函数
func _physics_process(_delta: float) -> void:
	
	#position.direction_to(target) * speed是人到鼠标坐标的向量
	velocity = position.direction_to(target) * speed
	
	#判断角色状态，以改变动画树的状态
	if position.direction_to(target) != Vector2.ZERO:
		is_running = true
		animation_tree["parameters/Idle/blend_position"] = position.direction_to(target)
		animation_tree["parameters/Run/blend_position"] = position.direction_to(target)
	else :
		is_running = false
	
	#防止到达目的地后抖动
	if position.distance_to(target) > 3:
		move_and_slide()
	else :
		#非移动状态下切换回false
		is_running = false

#当鼠标按下时启动
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			#get_global_mouse_position()是鼠标吧位置坐标
			target = get_global_mouse_position()
