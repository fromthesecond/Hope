package hope

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService


class ProfileController {

    @Secured(['ROLE_USER'])
    def profile() {}
}
