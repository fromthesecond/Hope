package hope

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import ua.ck.hope.Topic
import ua.ck.hope.User

@Secured(['ROLE_USER'])
class ProfileController {

    def profile() {
        println(User.findByUsername('John').getComment().body)
    }

    def getUsers() {
        render (User.findAll() as JSON)
    }
}
