# Questions Day 5

## 1. True or False: we can prevent the heap being erased during upgrades by using a stable heap

Yes, a heap data structure could be implemented in a stable variable.

## 2. A.call() -> B.call() -> C How much time (or rounds of consensus) do we need to wait for an answer?

**5 rounds** of consensus:

1. call from outside
2. call from A to A
3. call from B to C
4. handle response from C in B
5. handle response from B in A

## 3. Is possible to realize an inter-canister call in query mode?

**No**, only on update calls.
