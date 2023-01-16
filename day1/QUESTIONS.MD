# Questions Day 1

## 1. How much is the current memory capacity of a canister?

**48GB** since <https://dashboard.internetcomputer.org/proposal/92573>

(Before was 4GB, then 32 and planed to increase up to subnet memory)
<https://forum.dfinity.org/t/increased-canister-smart-contract-memory/6148>

## 2. What is the issue with the following code sample?

The variable **`counter` is declared as imutable** by using `let`.
So, trying to assign a new value (`counter := counter + 1`) will fail.
Use `var` to make it mutable:

```motoko
actor {
  var counter : Nat = 0;  // `let` was replaced by `var`
  public func increment_counter() : async () {
    counter := counter + 1;
  };
}
```

## 3. What is the issue with the following code sample?

The variable `message` is of type **`Text` and can't be initialized with 0**.

```motoko
actor {
  var message : Text = "";  // replaced `0` with empty string (`""`)

  public query func change_message(new_message : Text) : async () {
    message := new_message;
    return;
  };

  public query func see_message() : async Text {
    return(message);
  };
}
```

## 4. False or True: we can remove the keyword async for return argument of a query function since queries are faster to answer

**False**, async can not be removed

> An actor is similar to an object, but is different in that its state is completely isolated, its interactions with the world are entirely through asynchronous messaging, and its messages are processed one-at-a-time, even when issued in parallel by concurrent actors.
<https://internetcomputer.org/docs/current/developer-docs/build/cdks/motoko-dfinity/actors-async>

Removing the `async` keyword would result in the error `shared query function must have syntactic return type 'async <typ>'`
