package ua.ck.hope

class User {

    boolean enabled = true
    boolean accountExpired = false
    boolean accountLocked = false
    boolean passwordExpired = false
    String username
    String password
    Role role

    transient springSecurityService
    static transients = ['springSecurityService']

    static constraints = {
        username(blank: false, unique: true)
        password(blank: false, nullable: false, size: 6..65)
    }

    static mapping = {
        password column: '`password`'
    }

    Set<Role> getAuthorities() {

        [role]
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }
}