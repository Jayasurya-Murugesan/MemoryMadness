extends Node
 
const FRAME_IMAGES:Array=[
	 preload("res://assets/frames/blue_frame.png"), 
	 preload("res://assets/frames/green_frame.png"), 
	 preload("res://assets/frames/red_frame.png"), 
	 preload("res://assets/frames/yellow_frame.png")
]
var _item_images: Array=[]

func _ready():
	load_image()

#--- creating a dictionary and adding that to array 

func add_file_to_list(fn:String,path:String)->void:
	var full_path=path+"/"+fn
	
	var ii_dict = {
		"item_name":fn.rstrip(".png"),
		"item_texture":load(full_path)
	}
	_item_images.append(ii_dict)

#---loading images from glitch path  
func load_image()->void:
	var path = "res://assets/glitch/"
	var dir=DirAccess.open(path)
	
	if not dir:
		print("ERROR:", path)
		return
	var file_names=dir.get_files()
	
	#--- ignoring .import files  
	for file_name in file_names:
		if ".import" not in file_name:
			add_file_to_list(file_name,path)


func get_random_item_image()->Dictionary:
	return _item_images.pick_random()



func get_image(index :int )->Dictionary:
	return  _item_images[index]

func get_random_frame_images()-> CompressedTexture2D:
	return FRAME_IMAGES.pick_random()
	
func shuffle_image()->void:
	_item_images.shuffle()















