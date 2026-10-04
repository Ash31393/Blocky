"""Toy append-only hashed ledger — step 1: one block type."""

from __future__ import annotations

import hashlib
import json
from dataclasses import dataclass


def sha256_hex(text: str) -> str:
    """Return the SHA-256 hex digest of a UTF-8 string."""
    return hashlib.sha256(text.encode("utf-8")).hexdigest()


@dataclass
class Block:
    index: int
    data: str
    prev_hash: str
    block_hash: str = ""

    def compute_hash(self) -> str:
        # Hash only the meaningful fields (not block_hash itself).
        payload = json.dumps(
            {"index": self.index, "data": self.data, "prev_hash": self.prev_hash},
            sort_keys=True,
        )
        return sha256_hex(payload)


def make_block(index: int, data: str, prev_hash: str) -> Block:
    block = Block(index=index, data=data, prev_hash=prev_hash)
    block.block_hash = block.compute_hash()
    return block


def chain_is_valid(chain: list[Block]) -> bool:
    for i, block in enumerate(chain):
        if block.block_hash != block.compute_hash():
            return False  # contents were tampered with
        if i == 0:
            continue
        if block.prev_hash != chain[i - 1].block_hash:
            return False  # broken link to previous block
    return True


def main() -> None:
    genesis = make_block(0, "genesis", "0" * 64)
    second = make_block(1, "alice pays bob 5", genesis.block_hash)
    chain = [genesis, second]

    for block in chain:
        print(block)
    print("valid:", chain_is_valid(chain))

    # Tamper demo: change data but leave stored hash alone
    second.data = "alice pays bob 500"
    print("valid after tamper:", chain_is_valid(chain))


if __name__ == "__main__":
    main()
