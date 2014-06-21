package ua.ck.hope

class User {

    boolean enabled = true
    boolean accountExpired = false
    boolean accountLocked = false
    boolean passwordExpired = false
    String username
    String password
    String firstName
    String lastName
    Date date
    Integer karma
    Role role
    transient springSecurityService

    static hasMany = [comments: Comment, threads: Thread]

    static constraints = {
        username(blank: false, unique: true, size: 4..15)
        password(blank: false, nullable: false, size: 6..65)
        firstName(nullable: true, size: 3..20)
        lastName(nullable: true, size: 3..20)
        karma(nullable: true)
        date (nullable: false)
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