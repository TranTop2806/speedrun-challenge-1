# 🚩 Challenge 1: Decentralized Staking App

This is a solution for Challenge 1 of SpeedRunEthereum. The goal is to build a staking dApp where users can pool funds together to reach a threshold within a deadline.

## 🔗 Links
- **Live Demo (Frontend):**  https://nextjs-hshz4xda2-tranvananhthu280604-gmailcoms-projects.vercel.app
- **Smart Contract (Sepolia):** https://sepolia.etherscan.io/address/0x69Dc1a130d98D38E4F1a222E6462040404bba877#code

## 🛠 Tech Stack
- **Solidity** (Smart Contract)
- **Scaffold-ETH 2** (React, NextJS, RainbowKit, Hardhat, Wagmi)
- **Sepolia Testnet**

## 🧩 Key Features
1.  **Stake:** Users can stake ETH into the contract.
2.  **Execute:**
    - If `Balance >= Threshold` && `Deadline Passed`: Funds are sent to `ExampleExternalContract`.
    - If `Balance < Threshold` && `Deadline Passed`: Withdrawal is enabled.
3.  **Withdraw:** Users can withdraw their funds if the staking goal is not met.
4.  **Time Left:** Displays a countdown timer.

## 🏃‍♂️ How to Run Locally

1. **Install Dependencies**
   ```bash
   yarn install