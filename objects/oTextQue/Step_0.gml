if (ticket == 0){
	with(instance_create_layer(0,0,layer,oText)){
		background = other.background
		message = other.message
		resp = other.resp
		originInstance = other.originInstance
		respScripts = other.respScripts
	}
	instance_destroy()
}
