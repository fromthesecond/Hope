package ua.ck.hope

class Thread {
    String title
    User author
    Comment comment
    String body
    Date date
    String forum
    Integer rating
    String keywords

    static belongsTo = User
    //static hasMany = [comments: Comment]
    static constraints = {
        title (nullable: false, size: 3..150)
        body (nullable: false, size: 3..10000)
        forum (nullable: false, size: 3..200)
        rating (nullable: true, size: -1000..1000)
    }
    static mapping = {
        rating defaultValue: 0
    }
}
