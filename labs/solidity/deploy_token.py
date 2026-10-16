import getpass
import os
from pathlib import Path

import solcx
from web3 import Web3

RPC_URL = "https://ethereum-sepolia-rpc.publicnode.com"
CHAIN_ID = 11155111
SOL_PATH = Path(__file__).with_name("BlockyToken.sol")


def compile_contract():
    solcx.install_solc("0.8.20")
    compiled = solcx.compile_files(
        [SOL_PATH],
        output_values=["abi", "bin"],
        solc_version="0.8.20",
    )
    _, contract_interface = compiled.popitem()
    return contract_interface["abi"], contract_interface["bin"]


def main():
    abi, bytecode = compile_contract()
    print(f"Compiled BlockyToken.sol! Bytecode length: {len(bytecode)} hex chars")

    w3 = Web3(Web3.HTTPProvider(RPC_URL))
    print(
        f"Connected to Sepolia RPC: {w3.is_connected()} (Chain ID: {w3.eth.chain_id})"
    )

    private_key = (
        os.getenv("PRIVATE_KEY")
        or getpass.getpass(
            "Paste your MetaMask Sepolia account Private Key (hidden input, or press Enter to skip deploy): "
        ).strip()
    )
    if not private_key:
        print("Dry-run complete! Re-run with your testnet key when ready to deploy.")
        return

    account = w3.eth.account.from_key(private_key)
    balance_eth = w3.from_wei(w3.eth.get_balance(account.address), "ether")
    print(
        f"Deploying from wallet: {account.address} (Balance: {balance_eth} SepoliaETH)"
    )

    Token = w3.eth.contract(abi=abi, bytecode=bytecode)
    tx = Token.constructor(1_000_000).build_transaction(
        {
            "chainId": CHAIN_ID,
            "from": account.address,
            "nonce": w3.eth.get_transaction_count(account.address),
        }
    )

    signed_tx = account.sign_transaction(tx)
    tx_hash = w3.eth.send_raw_transaction(signed_tx.raw_transaction)
    print(f"Transaction sent! Waiting for block confirmation... (tx: {tx_hash.hex()})")

    receipt = w3.eth.wait_for_transaction_receipt(tx_hash)
    print(f"Deployed! BlockyToken address: {receipt.contractAddress}")
    print(
        f"View on Etherscan: https://sepolia.etherscan.io/address/{receipt.contractAddress}"
    )


if __name__ == "__main__":
    main()
