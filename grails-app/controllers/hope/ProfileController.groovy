package hope

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import ua.ck.hope.User

@Secured(['ROLE_USER'])
class ProfileController {

    def profile() {}

    def getUsers() {
        render (User.findAll() as JSON)
    }
}
