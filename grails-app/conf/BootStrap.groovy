import ua.ck.hope.Role
import ua.ck.hope.User


class BootStrap {

    def init = { servletContext ->

        def userRole = populateRole('ROLE_USER')
        def testUser = populateUser('John', 'password', userRole)
        println('User with login '+ testUser.username + ' and role ' + testUser.role.authority + ' created')
        println(userRole.authority + userRole.id)

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

    private static User populateUser(String username, String password, Role role) {
        def user = User.findByUsername(username)
        if(!user) {
            user = new User(
                    username: username,
                    password: password,
                    role: role
            )
            user.save(flush: true, failOnError: true)

        }
        return user
    }

}
