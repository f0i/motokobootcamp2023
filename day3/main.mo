import Book "book";
import List "mo:base/List";
import Utils "utils";

actor {

    // Challenge 1 (proxy, see utils.mo)
    // In your file called utils.mo: create a function called second_maximum that takes an array [Int] of integers and returns the second largest number in the array.
    public query func second_maximum(array : [Int]) : async Int {
        return Utils.second_maximum(array);
    };

    // Challenge 2 (proxy, see utils.mo)
    // In your file called utils.mo: create a function called remove_even that takes an array [Nat] and returns a new array with only the odd numbers from the original array.
    public query func remove_even(array : [Nat]) : async [Nat] {
        return Utils.remove_even(array);
    };

    // Challenge 3 (proxi, see utils.mo)
    // In your file called utils.mo: write a function drop that takes 2 parameters: an array [T] and a Nat n. This function will drop the n first elements of the array and returns the remainder.
    public query func drop(xs : [Nat], n : Nat) : async [Nat] {
        return Utils.drop(xs, n);
    };

    // Challenge 4 (see book.mo)
    // In your file called book.mo create a custom type with at least 2 properties (title of type Text, pages of type Nat), import this type in your main.mo and create a variable that will store a book.

    // Challenge 5 (part 2, see book.mo)
    // In your file called book.mo create a function called create_book that takes two parameters: a title of type Text, and a number of pages of type Nat and returns a book.
    // This function will create a new book based on the parameters passed and then read it before returning it.
    let book : Book.Book = { title = "asdf"; pages = 123 };

    // Challenge 6
    // In main.mo import the type List from the Base Library and create a list that stores books.
    var books : List.List<Book.Book> = List.nil<Book.Book>();

    // Challenge 7
    // In main.mo create a function called add_book that takes a book as parameter and returns nothing this function should add this book to your list.
    // Then create a second function called get_books that takes no parameter but returns an Array that contains all books stored in the list.
    public func add_book(new_book : Book.Book) : async () {
        books := List.push(new_book, books);
    };

    public query func get_books() : async [Book.Book] {
        return List.toArray(books);
    };

};
