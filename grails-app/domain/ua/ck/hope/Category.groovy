package ua.ck.hope

class Category {
    String name

    static hasMany = [threads: Thread]

    static constraints = {
        threads(nullable: true)
    }
}
