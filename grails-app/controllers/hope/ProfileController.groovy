package hope

import grails.plugin.springsecurity.annotation.Secured


@Secured(['ROLE_USER'])
class ProfileController {

    def checkUser () {

    }
    def profile() {}
}
