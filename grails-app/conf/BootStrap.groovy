import ua.ck.hope.Comment
import ua.ck.hope.Role
import ua.ck.hope.Thread
import ua.ck.hope.*


class BootStrap {
    def init = { servletContext ->
        def userRole = populateRole('ROLE_USER')
        def adminRole = populateRole('ROLE_ADMIN')

        def testUser = populateUser('John', 'password', userRole, new Date())
        def testAdmin = populateUser('Jack', 'password', adminRole, new Date())

        new Category(name: 'Recent News').save(flush: true)
        new Category(name: 'Questions about Java').save(flush: true)
        new Category(name: 'Questions about Grails').save(flush: true)
        new Category(name: 'Questions about JavaScript/JQuery').save(flush: true)
        new Category(name: 'Question about other Frameworks').save(flush: true)
        new Category(name: 'Other Questions').save(flush: true)

        def thread = new Thread(
                title: 'Title of new Thread',
                body: 'A new question. How to set value into Java?',
                date: new Date(),
                rating: 2,
                keywords: 'Java, value, set',
                author: User.findById(1),
                category: Category.findById(2)
        ).save(flush: true)

        println('Test thread has been created! ' + Thread.findById(1).title)
        println('Categories have been created: ' + Category.findById(1).name + " and " + Category.findById(2).name)
        println('User with login '+ testUser.username + ' has been created ' + testUser.date)
        println('Admin with login '+ testAdmin.username + ' has been created ' + testAdmin.date)
    }
    def destroy = {
    }

    private static Role populateRole(String authority) {
        def role = Role.findByAuthority(authority)
        if(!role) {
            role = new Role(authority: authority)
            role.save(flush: true, failOnError: true)
        }
        return role
    }

    private static User populateUser(String username, String password, Role role, Date date) {
        def user = User.findByUsername(username)
        if(!user) {
            user = new User(
                    username: username,
                    password: password,
                    role: role,
                    date: date,
                    karma: 100
            )
            user.save(flush: true, failOnError: true)
        }
        return user
    }

}
