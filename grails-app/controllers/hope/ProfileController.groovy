package hope

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import ua.ck.hope.*

@Secured(['ROLE_USER'])
class ProfileController {

    static SpringSecurityService springSecurityService
    static allowedMethods = [addTopic: "POST", delTopic: "POST"]
    def profile() {
        [details: User.find(springSecurityService.currentUser),
         category: Category.findAll(),
         userThreads: User.find(springSecurityService.currentUser).getThreads(),
         userComments: User.find(springSecurityService.currentUser).getComments()]
    }

    def delComment () {
        println(params.id)
        Comment comment = Comment.findById(params.id)
        if (comment) {
            comment.delete(flush: true)
            redirect(action: "profile")
        } else {
            println('Server Error')
        }

    }
    def delTopic () {
        Thread thread = Thread.findById(params.id)
        println(thread.title)
        if (thread) {
            thread.delete(flush: true)
            render ([success: true] as JSON)
        } else {
            render ([success: false] as JSON)
        }
    }
    def getUsers() {
        def current = springSecurityService.currentUser
        def user = User.find(springSecurityService.currentUser)
        def info = [
          'user': user,
          'comments': user.getComments(),
          'threads': user.getThreads()
        ]
        render (user as JSON)
    }

    def setUsername () {
        def current = springSecurityService.currentUser
        def user = User.find(current)
        user.setUsername(params.username)
        user.save(flush: true)
        user.validate()
        if (!user.hasErrors()) {
            render ([success: true] as JSON)
        } else {
            render ([success: false] as JSON)
        }
    }
    def updateFirstName () {
        def user = User.find(springSecurityService.currentUser)
        user.setFirstName(params.first)
        user.save(flush: true)
        user.validate()
        if (!user.hasErrors()) {
            render ([success: true] as JSON)
        } else {
            render ([success: false] as JSON)
        }

    }
    def addTopic () {
        def thread = new Thread(
                title: params.title,
                body: params.body,
                date: new Date(),
                rating: 0,
                keywords: params.keywords,
                author: springSecurityService.currentUser,
                category: Category.findByName(params.category)
        )
        if (thread.validate()) {
            thread.save(flush: true)
            render ([success: true] as JSON)
        } else {
            render ([success: false] as JSON)
        }
    }
}
