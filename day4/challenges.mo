import List "mo:base/List";
import TrieSet "mo:base/TrieSet";
import Iter "mo:base/Iter";
import Order "mo:base/Order";
import Nat "mo:base/Nat";
import Buffer "mo:base/Buffer";
import Debug "mo:base/Debug";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";

// Day 4
actor Day4 {
    type List<T> = List.List<T>;

    // Challenge 1
    // Write a function unique that takes a list l of type List and returns a new list with all duplicate elements removed.
    // Assumptions: preserve order
    func unique<T>(l : List<T>, compare : (T, T) -> Order.Order) : List<T> {
        let iter = List.toIter(l);
        let sorted = Iter.sort<T>(iter, func(a : T, b : T) = compare(a, b));
        switch (sorted.next()) {
            case (null) { return List.nil() /* return empty list */ };
            case (?first) {
                var prev = first;
                let filtered = Iter.filter<T>(sorted, func(x : T) = (Order.isEqual(compare(x, prev))));
                return Iter.toList(sorted);
            };
        };
    };

    public query func unique_test(l : List<Nat>) : async List<Nat> {
        return unique<Nat>(l, Nat.compare);
    };

    // Challenge 2
    // Write a function reverse that takes l of type List and returns the reversed list.
    func reverse<T>(l : List<T>) : List<T> {
        return List.reverse(l);
    };

    public query func reverse_test(l : List<Nat>) : async List<Nat> {
        return reverse(l);
    };

    // Challenge 3
    // Write a function is_anonymous that takes no arguments but returns a Boolean indicating if the caller is anonymous or not.
    public shared ({ caller }) func is_anonymous() : async Bool {
        return Principal.isAnonymous(caller);
    };

    // Challenge 4
    // Write a function find_in_buffer that takes two arguments, buf of type Buffer and val of type T, and returns the index of the first occurrence of "val" in "buf".
    func find_in_buffer<T>(buf : Buffer.Buffer<T>, val : T, equal : (T, T) -> Bool) : Nat {
        let index = Buffer.indexOf<T>(val, buf, equal);
        switch (index) {
            case (?i) { return i };
            case (null) { Debug.trap("Element not included") };
        };
    };

    // Challenge 5
    // Add a function called get_usernames that will return an array of tuples (Principal, Text) which contains all the entries in usernames.
    let usernames = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);

    public shared ({ caller }) func add_username(name : Text) : async () {
        usernames.put(caller, name);
    };

    public query func get_usernames() : async [(Principal, Text)] {
        return (Iter.toArray(usernames.entries()));
    };

};
