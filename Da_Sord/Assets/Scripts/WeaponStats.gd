extends Area2D

export var damage = 5
export var knockBack = 10


func _on_AtkArea_body_entered(body):
	if body.is_in_group("Ouchable"):
		body.TakeDamage(damage, knockBack, global_position)
