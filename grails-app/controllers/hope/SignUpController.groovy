package hope

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import ua.ck.hope.Role
import ua.ck.hope.User

@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
class SignUpController {

    static allowedMethods = [submit: "POST"]

    def signUp() {}

    def submit () {

        def user = new User (params)
        user.role = Role.findByAuthority('ROLE_USER')
        user.date = new Date()
        user.validate()
        //
        if (user.hasErrors()) {
            render([success: false] as JSON)
        } else {
            user.save(flush: true, failOnError: true)
            println('User '+ user.username+ ' created ' + user.date )
            render ([success:true] as JSON)
        }

    }
}
