package hope

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import ua.ck.hope.*

@Secured(['ROLE_ADMIN'])
class AdminController {

    def index() {
        [users: User.findAll(), comments: Comment.findAll(), topics: Thread.findAll()]
    }
    def user () {
        [user: User.findById(params.id)]
    }
    def delTopic () {
        Thread thread = Thread.findById(params.id)
        println(thread.title)
        if (thread) {
            thread.delete(flush: true)
            redirect(action: 'index')
        } else {
            println('Server Error!')
        }
    }

    def delComment () {
        Comment comment = Comment.findById(params.id)
        if (comment) {
            comment.delete(flush: true)
            redirect(action: 'index')
        } else {
            println('Server Error!')
        }
    }
    def changeRole () {
        def role = User.findById(params.id).role.authority
        println(role)
        if (role.equals('ROLE_ADMIN')){
            redirect(action: 'index', controller: 'admin')
        } else {

            redirect(action: 'user')
        }
    }
}
