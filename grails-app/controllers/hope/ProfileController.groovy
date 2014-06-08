package hope

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import ua.ck.hope.*

@Secured(['ROLE_USER'])
class ProfileController {

    SpringSecurityService springSecurityService
    static allowedMethods = [addTopic: "POST"]
    def profile() {
        [category: Category.findAll()]
    }

    def getUsers() {
        def current = springSecurityService.currentUser
        def user = User.find(springSecurityService.currentUser)
        def info = [
          'user': user,
          'comments': user.getComments(),
          'threads': user.getThreads()
        ]
        render (info as JSON)
    }
    def addTopic () {
        def thread = new Thread(
                title: params.title,
                body: params.body,
                date: new Date(),
                rating: 0,
                keywords: params.keywords,
                author: springSecurityService.currentUser,
                category: params.category
        )
        thread.validate()
        thread.save(flush: true)
        render ([success: true] as JSON)
    }
}
