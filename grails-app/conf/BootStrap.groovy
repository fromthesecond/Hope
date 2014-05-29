import ua.ck.hope.Comment
import ua.ck.hope.Role
import ua.ck.hope.Topic
import ua.ck.hope.User


class BootStrap {
    def init = { servletContext ->
        def userRole = populateRole('ROLE_USER')
        def testUser = populateUser('John', 'password', userRole, new Date())
        def adminRole = populateRole('ROLE_ADMIN')
        def testAdmin = populateUser('Jack', 'password', adminRole, new Date())
        def testComment = new Comment(
                author: testUser,
                body: 'My first comment',
                date: new Date()
        )
        testComment.save(flush: true)
        println('User with login '+ testUser.username + ' has been created ' + testUser.date)
        println('Admin with login '+ testAdmin.username + ' has been created ' + testAdmin.date)
        println(testUser.getComment().collect {it.body})
        println(testComment.author.firstName + ' from comment object')
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
                    date: date
            )
            user.save(flush: true, failOnError: true)

        }
        return user
    }

}
