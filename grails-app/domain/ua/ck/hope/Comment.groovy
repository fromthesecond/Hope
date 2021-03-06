package ua.ck.hope

class Comment {
    String body
    Date date
    Integer rating

    static belongsTo = [author: User, threads: Thread]

    static constraints = {
        body(nullable: false, size: 1..4000)
        date(nullable: false)
        rating(nullable: true, size: -1000..1000)
    }
    static mapping = {
        rating defaultValue: 0
    }
}
