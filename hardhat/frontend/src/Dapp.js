import { ethers } from "ethers";
import { useEffect, useState } from 'react';

export const provider = new ethers.providers.Web3Provider(window.ethereum)

const contractAddress = "0x5fbdb2315678afecb367f032d93f642f64180aa3";

// The ERC-20 Contract ABI, which is a common contract interface
// for tokens (this is the Human-Readable ABI format)
const abi = [
  // Get the token name
  "function getTokenName() view returns (string)",

  // Get the account balance
  "function balanceOf(address) view returns (uint)",

  // Send some of your tokens to someone else
  "function transfer(address to, uint amount)",

  // Transfer 500 tokens for your account
  "function transferFromAddr1(address to)",
];

// The Contract object
export const shtContract = new ethers.Contract(contractAddress, abi, provider);
export const signer = shtContract.connect(provider.getSigner())

const Dapp = () => {

  const [tokenName, setTokenName] = useState(undefined)
  const [account, setAccount] = useState(undefined)
  const [balance, setBalance] = useState(undefined)


  useEffect(() => {
    const fetchInitialData = async () => {

      await provider.send("eth_requestAccounts", []);
      const signer = await provider.getSigner()

      const contractUser = await signer.getAddress();
      setAccount(contractUser)

      const name = await shtContract.getTokenName()
      setTokenName(name)

      const bigNumber = await shtContract.balanceOf(contractUser)
      const balance = bigNumber.toNumber()
      setBalance(balance)
    }

    fetchInitialData()
  }, [])

  const receiveTokens = async () => {
    await signer.transferFromAddr1(account)
    // TODO update balance when transaction ready
  }

  return (
    <div
      style={{
        flex: 1,
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center'
      }}
    >
      <div>
        {tokenName}
      </div>
      <div>
        {account}
      </div>
      <div>
        {balance} SHT tokens
      </div>
      <div>
        <button onClick={receiveTokens}>
          get 500 tokens
        </button>
      </div>
    </div>
  );
}

export default Dapp;
