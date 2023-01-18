# Questions Day 3

## 1. True or False: the Internet Computer has a unique public key that can be used to verify responses coming from any subnets

**True**: There is one public key (of the NNS subnet).
The NNS subnet-key certifies the public-keys of all other subnets.
Therefor only the **NNS subnet public key** is needed to verify other subnet public keys which then can be used to verify the responses.

## 2. True or False: when I realize an update call, the boundary node will participate in the consensus but not during query calls

**False**, it's **subnet nodes, not boundary nodes** that participate in consensus.
The part about query calls go through one node of the subnet, and update calls require consensus is **true**.

## 3. True or False: I can create a certified variable that will certify the response of the following actor

False: The response depends on the parameter and can't be precomputed to be stored in a certified variable.
Instead an update call could be used to verify the response.
