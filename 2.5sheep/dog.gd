extends CharacterBody2D

@onready var sheepman = $"../sheepman"
var follow_speed = 120 # 追随速度
var length = 70#追随距离

func _process(_delta):
	# 计算当前位置到目标位置的方向
	var direction = sheepman.position - self.position
	# 如果玩家离得太近，就不追随
	if direction.length() < length: # 可以根据需要调整距离
		
		#return会立即结束函数，从头开始运行
		return
	
	# 归一化方向向量
	direction = direction.normalized()
	# 计算速度
	velocity = direction * follow_speed
	# 应用速度
	self.velocity = velocity
	move_and_slide()
