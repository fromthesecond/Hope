package hope

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import ua.ck.hope.*
class IndexController {

    static allowedMethods = [addComment: "POST"]
    def current
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
    def showThread () {
        current = params.id
        [details: Thread.findById(params.id),
         comment: Thread.findById(params.id).getComments(),
         current: springSecurityService.currentUser]
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def comments (){
        render ([Thread.findById(current).getComments()])
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def getCurrentUsername () {
        def currentUser = springSecurityService.currentUser
        render (currentUser as JSON)
    }
    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def addComment () {
        def comment = new Comment(
             body: params.body,
             date: new Date(),
             author: User.find(springSecurityService.currentUser),
             threads: Thread.findById(params.idThread)
        )
        if (comment.validate()) {
            comment.save(flush: true, failOnError: true)
            render([success: true] as JSON)
        } else {
            render ([success: false] as JSON)
        }
    }
}
