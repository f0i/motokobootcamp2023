import Error "mo:base/Error";
import Array "mo:base/Array";
import Int "mo:base/Int";
import Iter "mo:base/Iter";
import Debug "mo:base/Debug";

module Utils {

    // Challenge 1
    // In your file called utils.mo: create a function called second_maximum that takes an array [Int] of integers and returns the second largest number in the array.
    public func second_maximum(array : [Int]) : Int {
        if (array.size() < 2) {
            Debug.trap("parameter 'array' must contain at least two elements");
        };
        // Initialize with small values (less or equal to what second_max will be at the end)
        var max = Int.min(array[0], array[1]);
        var second_max = max;

        // loop through the elements and keep track of the biggest two numbers
        for (n in array.vals()) {
            if (n > second_max) {
                if (n > max) {
                    second_max := max;
                    max := n;
                } else {
                    second_max := n;
                };
            };
        };

        return second_max;
    };

    // Challenge 2
    // In your file called utils.mo: create a function called remove_even that takes an array [Nat] and returns a new array with only the odd numbers from the original array.
    public func remove_even(array : [Nat]) : [Nat] {
        let vals = array.vals();
        let filtered = Iter.filter<Nat>(vals, func(n : Nat) = (n % 2 == 1));
        return Iter.toArray(filtered);
    };

    // Challenge 3
    // In your file called utils.mo: write a function drop that takes 2 parameters: an array [T] and a Nat n. This function will drop the n first elements of the array and returns the remainder.
    public func drop<T>(xs : [T], n : Nat) : [T] {
        if (xs.size() <= n) return [];

        let range = Iter.range(n, xs.size() - 1);
        let values = Iter.map<Nat, T>(range, func(i : Nat) = xs[i]);

        return Iter.toArray(values);
    };
};
