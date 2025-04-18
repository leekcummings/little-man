extends Node2D

# https://github.com/alinehui/partially-clickthrough-transparent/blob/main/main.gd
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_passthrough($Area2D/Cat) # change this if sprite name changes

func set_passthrough(sprite: AnimatedSprite2D):
	var viewportSize: Vector2 = get_viewport().size
	var scaledSizeX = 1#viewportSize[0] / 1920
	var scaledSizeY = 1# viewportSize[1] / 1080
	var texture_center: Vector2 = Vector2(sprite.sprite_frames.get_frame_texture(
		sprite.animation, sprite.frame).get_size()) * 0.5 * sprite.scale.x
	var texture_corners: PackedVector2Array = [
		Vector2((sprite.global_position[0] + texture_center[0]*-1)*scaledSizeX, (sprite.global_position[1] + texture_center[1]*0)*scaledSizeY), # Top left corner
		Vector2((sprite.global_position[0] + texture_center[0]*1)*scaledSizeX, (sprite.global_position[1] + texture_center[1]*0)*scaledSizeY), # Top right corner
		Vector2((sprite.global_position[0] + texture_center[0]*1)*scaledSizeX, (sprite.global_position[1] + texture_center[1]*2)*scaledSizeY), # Bottom right corner
		Vector2((sprite.global_position[0] + texture_center[0]*-1)*scaledSizeX, (sprite.global_position[1] + texture_center[1]*2)*scaledSizeY) # Bottom left corner
	]
	
	#print(texture_corners)
	
	DisplayServer.window_set_mouse_passthrough(texture_corners)

#extends Node2D
#
## https://github.com/alinehui/partially-clickthrough-transparent/blob/main/main.gd
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#set_passthrough($Area2D/Cat) # change this if sprite name changes
#
#func set_passthrough(sprite: AnimatedSprite2D):
	#var texture_center: Vector2 = Vector2(sprite.sprite_frames.get_frame_texture(sprite.animation, sprite.frame).get_size()) * 0.5*sprite.scale.x
	#var texture_corners: PackedVector2Array = [
		#sprite.global_position + texture_center * Vector2(-1, -1), # Top left corner
		#sprite.global_position + texture_center * Vector2(1, -1), # Top right corner
		#sprite.global_position + texture_center * Vector2(1 , 1), # Bottom right corner
		#sprite.global_position + texture_center * Vector2(-1 ,1) # Bottom left corner
	#]
	#
	#DisplayServer.window_set_mouse_passthrough(texture_corners)
#
#
#func _on_letter_display_timer_timeout() -> void:
	#pass # Replace with function body.
