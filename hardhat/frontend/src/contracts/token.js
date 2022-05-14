import { ethers } from "ethers";

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

  // Transfer 500 tokens to your account
  "function transferFromAddr1(address to)",
];

// The Contract object
export const shtContract = new ethers.Contract(contractAddress, abi, provider);

export const signer = shtContract.connect(provider.getSigner())