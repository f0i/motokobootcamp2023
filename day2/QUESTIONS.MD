# Questions Day 1

## 1. Who controls the ledger canister?

The **NNS** DAO (Network Nervous System).

## 2. What is the subnet of the canister with the id: mwrha-maaaa-aaaab-qabqq-cai? How much nodes are running this subnet?

It is on the application subnet with the ID **pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe**.

<https://dashboard.internetcomputer.org/canister/mwrha-maaaa-aaaab-qabqq-cai>

This subnet consits of **16 Node Machines**.

<https://dashboard.internetcomputer.org/subnet/pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe>

## 3. I have a neuron with 1O ICPs locked with a dissolve delay of 4 years - my neuron has been locked for 2 years. What is my expected voting power?

- Amount: 10 ICP
- Delay bonus: 1.5
- Age bonus: 1 + 0.25 * 2 / 4 = 1.125

Total = 10 \* 1.5 \* 1.125 = **16.875**

## 4. What is wrong with the following code?

Missing import of `base/Nat`.

```motoko
import Nat "mo:base/Nat";  // import was added

actor {
  let n : Nat = 50;
  let t : Text = "Hello";

  public func convert_to_text(m : Nat) : async Text {
    Nat.toText(m);
  };
 
};
```

## 5. What is wrong with the following code?

Primary issue: The variable `languages` is a mutable array and can't be returned.

Also the initial value for the variable is of different type (should be `... [var Text] = [var "English", ...]` if it has to be mutable).

```motoko
actor {
  var languages : [Text] = ["English", "German", "Chinese", "Japanese", "French"]; // Removed `var` from type annotation

  public func show_languages(language : Text) : async [Text] {  // `var` was removed from return type
    return (languages);
  };
 
};
```

## 6. What is wrong with the following code?

`Array.append` is deprecated.
Since arrays have a fixed size, all elements have to be copied.
Other data structures would be more efficient (e.g. List or Buffer).

> WARNING: If you are looking for a list that can grow and shrink in size, it is recommended you use either the Buffer class or the List class for those purposes. Arrays must be created with a fixed size.
<https://internetcomputer.org/docs/current/references/motoko-ref/Array>

```motoko
import Buffer "mo:base/Buffer";  // added import

actor {
    var languages = Buffer.fromArray<Text>(["English", "German", "Chinese", "Japanese", "French"]);  // Change type to `Buffer`

    public func add_language(new_language : Text) : async [Text] {
        languages.add(new_language);  // use `add` function to insert `new_language`
        return (Buffer.toArray(languages));  // Return as array
    };

};
```
