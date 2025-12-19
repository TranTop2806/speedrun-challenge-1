# 🚩 Challenge 1: Decentralized Staking App

This is a solution for Challenge 1 of SpeedRunEthereum. The goal is to build a decentralized Staking dApp where users can pool funds together to reach a specific **Threshold** within a **Deadline**.

If the goal is met, the funds are sent to an external contract (e.g., to buy a shared asset). If the goal is missed, users can withdraw their funds.

## 🔗 Live Demo & Contract
- **🌐 Live Frontend:** [https://nextjs-hshz4xda2-tranvananhthu280604-gmailcoms-projects.vercel.app](https://nextjs-hshz4xda2-tranvananhthu280604-gmailcoms-projects.vercel.app)
- **📜 Smart Contract (Sepolia):** [0x69Dc1a130d98D38E4F1a222E6462040404bba877](https://sepolia.etherscan.io/address/0x69Dc1a130d98D38E4F1a222E6462040404bba877#code)

## 🛠 Tech Stack
- **Solidity** (Smart Contract logic)
- **Scaffold-ETH 2** (Framework)
  - **NextJS** (Frontend)
  - **RainbowKit** (Wallet Connect)
  - **Hardhat** (Development Environment)
  - **Wagmi/Viem** (Ethereum Hooks)
- **Sepolia Testnet** (Public Deployment)

## 🧩 Key Features

1.  **Stake ETH:** Users can deposit ETH into the contract.
2.  **Deadline Mechanism:** The staking period is time-bound (e.g., 30 seconds or days from deployment).
3.  **Conditional Execution:**
    - ✅ **Success:** If `Contract Balance >= Threshold` AND `Deadline Passed` → `execute()` sends funds to `ExampleExternalContract`.
    - ❌ **Failure:** If `Contract Balance < Threshold` AND `Deadline Passed` → `withdraw()` becomes active for users to reclaim funds.
4.  **Countdown Timer:** Real-time visualization of the time remaining.
5.  **Events:** Emits `Stake` events for frontend updates.

---

## 🏃‍♂️ How to Run Locally (Hướng dẫn chạy dự án)

Prerequisites: [Node.js](https://nodejs.org/) (>= v18.17) and [Yarn](https://yarnpkg.com/).

### 1. Clone & Install
Clone the repository and install dependencies:
```bash
git clone [https://github.com/TranTop2806/challenge-1-decentralized-staking.git](https://github.com/TranTop2806/challenge-1-decentralized-staking.git)
cd challenge-1-decentralized-staking
yarn install
```
### 2. Start the Local Chain
Open Terminal 1. Start a local Ethereum network (Hardhat chain):

```bash
yarn chain
```
### 3. Deploy Contracts
Open Terminal 2. Deploy the smart contracts to your local chain:

```bash
yarn deploy
```
Tip: To redeploy fresh contracts later, run yarn deploy --reset.

### 4. Start the Frontend
Open Terminal 3. Launch the NextJS application:

```bash
yarn start
```
Visit http://localhost:3000 to interact with the dApp.

### Testing the Logic 
You can test the two main scenarios (Success vs. Failure) locally:

#### Scenario A: Success (Goal Met)
Connect your wallet (Burner Wallet provided by Scaffold-ETH).

Stake ETH: Send enough ETH so that Contract Balance >= Threshold (Default threshold is usually 1 ETH).

Wait: Wait for the Deadline to expire (You will see the countdown reach 0).

Execute: Click the Execute button.

Result: The UI should show "Completed" and funds are moved to the External Contract.

#### Scenario B: Failure (Goal Missed)
Reset the chain or redeploy (yarn deploy --reset).

Stake ETH: Send a small amount (e.g., 0.1 ETH) so Balance < Threshold.

Wait: Wait for the Deadline to expire.

Withdraw: The Execute button will fail, but the Withdraw button should now be enabled.

Result: Clicking Withdraw returns the ETH to your wallet.

📜 Contract Verification
To verify the contract on Etherscan after deploying to a public testnet:

```bash
yarn verify --network sepolia
```