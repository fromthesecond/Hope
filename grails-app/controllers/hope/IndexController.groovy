package hope

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
class IndexController {

    SpringSecurityService springSecurityService

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
            render 'Hello, admin'
        } else {
            render 'Fatal Error with Sign In'
        }
    }
}
