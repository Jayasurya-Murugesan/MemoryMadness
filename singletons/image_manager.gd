extends Node
#--- ---#
var _item_images: Array=[]

func _ready():
	load_image()

#---loading images from glitch path ---#

func load_image()->void:
	var path ="res://assets//"
	var dir=DirAccess.open(path)
	
	if not dir:
		print("ERROR:", path)
		return
	var file_names=dir.get_files()
	
	#--- ignoring .import files ---#
	for file_name in file_names:
		if ".import" not in file_name:
			add_file_to_list(file_name,path)


#--- creating a dictionary and adding that to array---#

func add_file_to_list(fn:String,path:String)->void:
	var full_path=path+"/"+fn
	
	var ii_dict = {
		"item_name":fn.rstrip(".png"),
		"item:texture":load(full_path)
	}
	_item_images.append(ii_dict)
