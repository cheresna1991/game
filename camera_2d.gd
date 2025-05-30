extends Camera2D

func _ready():
	# Устанавливаем границы камеры равные размеру фона
	var texture_size = get_parent().get_node("TextureRect").texture.get_size()
	limit_left = -texture_size.x / 2
	limit_right = texture_size.x / 2
	limit_top = -texture_size.y / 2
	limit_bottom = texture_size.y / 2
