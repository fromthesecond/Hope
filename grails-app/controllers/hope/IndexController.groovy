package hope

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import ua.ck.hope.*
class IndexController {

    //static allowedMethods = [getCurrentUsername: "GET"]
    SpringSecurityService springSecurityService

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def index() {}

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def check() {

        def roleAdmin = 'ROLE_ADMIN'
        def roleUser = 'ROLE_USER'
        def current = springSecurityService.currentUser
        def role = current.role.authority

        if (role.equals(roleUser)) {
            redirect(controller: "profile", action: "profile")
        } else if (role.equals(roleAdmin)) {
            redirect(controller: 'admin', action: 'index')
        } else {
            render 'Fatal Error with Sign In'
        }
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def forum () {
        [category: Category.findAll()]
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def topics () {
        [thread: Category.findById(params.id).getThreads()]
    }
    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def getCurrentUsername () {
        def currentUser = springSecurityService.currentUser
        render (currentUser as JSON)
    }
}
