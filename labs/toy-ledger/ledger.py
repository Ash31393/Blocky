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


def main() -> None:
    genesis = Block(index=0, data="genesis", prev_hash="0" * 64)
    genesis.block_hash = genesis.compute_hash()
    print(genesis)


if __name__ == "__main__":
    main()
