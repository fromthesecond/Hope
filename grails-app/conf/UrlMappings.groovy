class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "index", action: "index")
        "/profile"(controller: "report", action: "profile")
        "500"(view:'/error')
	}
}
