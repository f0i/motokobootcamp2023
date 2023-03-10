import Float "mo:base/Float";
actor {

    // Challenge 1
    // Write a function multiply that takes two natural numbers and returns the product.
    public func multiply(n : Nat, m : Nat) : async Nat {
        return (n * m);
    };

    // Challenge 2
    // Write a function volume that takes a natural number n and returns the volumte of a cube with side length n.
    public func volume(n : Nat) : async Nat {
        return (n ** n);
    };

    // Challenge 3
    // Write a function hours_to_minutes that takes a number of hours n and returns the number of minutes.
    public func hours_to_minutes(n : Nat) : async Nat {
        return (n * 60);
    };

    // Challenge 4
    // Write two functions set_counter & get_counter.

    // set_counter sets the value of counter to n.
    var counter = 0;

    public func set_counter(n : Nat) : async () {
        counter := n;
    };

    // get_counter returns the current value of counter.
    public func get_counter() : async Nat {
        return counter;
    };

    // Challenge 5
    // Write a function test_divide that takes two natural numbers n and m and returns a boolean indicating if n divides m.
    public func test_divide(n : Nat, m : Nat) : async Bool {
        return (n % m == 0);
    };

    // Challenge 6
    // Write a function is_even that takes a natural number n and returns a boolean indicating if n is even.
    public func is_even(n : Nat) : async Bool {
        return (n % 2 == 0);
        // alternative: return await test_divide(n, 2);
    };

    // TedR's Homework Task 2
    public func multiply_int(n : Int, m : Int) : async Int {
        return (n * m);
    };

    // TedR's Homework Task 3
    public func multiply_add_sqrt(n : Int, m : Int) : async Float {
        let sum = Float.fromInt(n * m);
        return Float.sqrt(sum + 10.2);
    };

};
