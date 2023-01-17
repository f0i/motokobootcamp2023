# Homework from the final slide from Ted's lecture

This isn't a required homework, just a highly recommended exorcise!

## Task 1: Type of return value of hash function in Blob

Return type is **`Nat32`**.

```motoko
let hash : (b : Blob) -> Nat32
```

<https://internetcomputer.org/docs/current/references/motoko-ref/Blob#value-hash>

## Task 2: multiply

```motoko
actor {
    public func multiply(n : Int, m : Int) : async Int {
        return (n * m);
    };
};
```

## Task 3: Add `Int` and `Float`

```motoko
import Float "mo:base/Float";
actor {
    public func multiply_add_sqrt(n : Int, m : Int) : async Float {
        let sum = Float.fromInt(n * m);
        return Float.sqrt(sum + 10.2);
    };
};
```
