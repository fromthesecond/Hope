class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "index", action: "index")
        "/profile"(controller: "profile", action: "profile")
        "500"(view:'/error')
	}
}
