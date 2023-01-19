# Questions Day 4

## 1. Is the heap memory saved when upgrading a canister? How much heap memory does a canister has?

Heap memory is **not saved** when upgrading but fast then sable memory.
Heap size is limited by WASM to **4GB**.

## 2. How many accounts can a unique Principal own?

**almost unlimited**:
> A single Principal may have control over an (almost) unlimited number of Accounts.

Accounts are owned by one Principal, but a Principal can control multiple accounts.
