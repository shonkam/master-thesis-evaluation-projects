import { useEffect, useState } from 'react';
import { provider, shtContract, signer } from "./contracts/token";

const Dapp = () => {
  const [tokenName, setTokenName] = useState(undefined)
  const [account, setAccount] = useState(undefined)
  const [balance, setBalance] = useState(undefined)
  const [donateAmount, setDonateAmount] = useState(0)

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

  const handleDonateAmountChange = (event) => {
    setDonateAmount(event.target.value)
  }

  const donate = async (event) => {
    event.preventDefault()
    // account #1 on localhost testnet
    const receivingAddress = '0x70997970c51812dc3a010c7d01b50e0d17dc79c8'
    await signer.transfer(receivingAddress, donateAmount)
    // TODO update when transaction ready
  }

  return (
    <div
      style={{
        flex: 1,
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
        textAlign: 'center',
        marginTop: 5,
      }}
    >
      <div>
        {tokenName}
      </div>
      <div>
        Your account: {account}
      </div>
      <>
        Balance: {balance} SHT tokens
      </>
      <>
        <button onClick={receiveTokens}>
          get 500 tokens
        </button>
      </>

      <div style={{ marginTop: 40 }}>
        <>Donate tokens</>
        <form onSubmit={donate}>
          <>
            <input onChange={handleDonateAmountChange} />
            <div>
              <button type='submit'>Donate</button>
            </div>
          </>
        </form>
      </div>
    </div >
  );
}

export default Dapp;
