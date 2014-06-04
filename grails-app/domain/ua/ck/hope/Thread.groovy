package ua.ck.hope

class Thread {

    String title
    String body
    Date date
    Integer rating
    String keywords

    static belongsTo = [author: User, category: Category]

    static hasMany = [comments: Comment]
    static constraints = {
        title (nullable: false, size: 3..150)
        body (nullable: false, size: 3..10000)
        author(nullable: false)
        category(nullable: false)
        rating (nullable: true, size: -1000..1000)
        keywords (nullable: true, size: 3..150)
        comments (nullable: true)

    }
    static mapping = {
        rating defaultValue: 0
    }
}
