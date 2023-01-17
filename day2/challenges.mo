import Array "mo:base/Array";
import Error "mo:base/Error";
import Iter "mo:base/Iter";
import Char "mo:base/Char";
import HashMap "mo:base/HashMap";
import Order "mo:base/Order";
import Nat "mo:base/Nat";
import Nat32 "mo:base/Nat32";

// Day 2
actor {

    // Challenge 1
    // Write a function average_array that takes an array of integers and returns the average value of the elements in the array.
    public query func average_array(array : [Int]) : async Int {
        let size = array.size();
        if (size == 0) {
            throw Error.reject("parameter 'array' must not be empty");
        };
        let sum = Array.foldLeft<Int, Int>(array, 0, func(acc, n) = acc + n);
        return sum / size;
    };

    // Challenge 2
    // Character count: Write a function that takes in a string and a character, and returns the number of occurrences of that character in the string.
    public query func count_character(t : Text, c : Char) : async Nat {
        var count = 0;
        for (x in t.chars()) {
            if (x == c) {
                count := count + 1;
            };
        };
        return count;
    };

    // Challenge 3
    // Write a function factorial that takes a natural number n and returns the factorial of n.
    public query func factorial(n : Nat) : async Nat {
        if (n == 0) {
            return 1;
        };
        var sum : Nat = 1;
        for (i in Iter.range(1, n)) {
            sum := sum * i;
        };
        return sum;
    };

    // Challenge 4
    // Write a function number_of_words that takes a sentence and returns the number of words in the sentence.
    public query func number_of_words(t : Text) : async Nat {
        var count = 0;
        var in_word = false; // flag to check if previous char was part of a word
        for (c in t.chars()) {
            if (Char.isWhitespace(c)) {
                // whitespace
                in_word := false;
            } else if (not in_word) {
                // beginning of a word
                count += 1;
                in_word := true;
            }; // otherwise ignore the char
        };
        return count;
    };

    // Challenge 5
    // Write a function find_duplicates that takes an array of natural numbers and returns a new array containing all duplicate numbers.
    // The order of the elements in the returned array should be the same as the order of the first occurrence in the input array.
    type Seen = { #once : Nat; #multiple_times : Nat };

    public query func find_duplicates(a : [Nat]) : async [Nat] {
        let seen = HashMap.HashMap<Nat, Seen>(0, Nat.equal, func(x) = Nat32.fromIntWrap(x));

        // Count values in a HashMap
        var pos = 0;
        for (n in a.vals()) {
            switch (seen.get(n)) {
                case (null) {
                    seen.put(n, #once(pos));
                    pos := pos + 1;
                };
                case (?#once(p)) {
                    seen.put(n, #multiple_times(p));
                };
                case (_) {
                    // found number more than twice
                };
            };
        };

        var iter : Iter.Iter<(Nat, Seen)> = seen.entries();

        // only keep the ones the are present more than once
        func filter((_ : Nat, seen : Seen)) : Bool {
            switch (seen) {
                case (#multiple_times(_)) { true };
                case (_) { false };
            };
        };
        let filtered = Iter.filter<(Nat, Seen)>(iter, filter);

        // restore order
        func seen_to_pos(seen : Seen) : Nat {
            switch (seen) {
                case (#once(n)) { return n };
                case (#multiple_times(n)) { return n };
            };
        };
        func order((_ : Nat, seen_a : Seen), (_ : Nat, seen_b : Seen)) : Order.Order {
            Nat.compare(seen_to_pos(seen_a), seen_to_pos(seen_b));
        };
        let sorted = Iter.sort<(Nat, Seen)>(filtered, order);

        // extract values
        let values : Iter.Iter<Nat> = Iter.map<(Nat, Seen), Nat>(sorted, func(n : Nat, _) = n);

        return Iter.toArray(values);
    };

    // Challenge 6
    // Write a function convert_to_binary that takes a natural number n and returns a string representing the binary representation of n.
    public query func convert_to_binary(n : Nat) : async Text {
        switch (n) {
            case (0) { return "0" };
            case (1) { return "1" };
            case (_) {
                var binary = "";
                var rest = n;
                while (rest > 0) {
                    binary := Nat.toText(rest % 2) # binary;
                    rest := rest / 2;
                };
                return binary;
            };
        };
    };

    // alternative implementation of challenge 6
    public query func convert_to_binary_recursive(n : Nat) : async Text {
        return convert_to_binary_sync(n);
    };

    func convert_to_binary_sync(n : Nat) : Text {
        switch (n) {
            case (0) { return "0" };
            case (1) { return "1" };
            case (_) {
                return convert_to_binary_sync(n / 2) # convert_to_binary_sync(n % 2);
            };
        };
    };

};
