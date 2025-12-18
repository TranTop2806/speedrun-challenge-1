// SPDX-License-Identifier: MIT
pragma solidity 0.8.20; //Do not change the solidity version as it negatively impacts submission grading

import "hardhat/console.sol";
import "./ExampleExternalContract.sol";

contract Staker {
    ExampleExternalContract public exampleExternalContract;

    mapping(address => uint256) public balances;

    uint256 public constant threshold = 1 ether;

    uint256 public deadline = block.timestamp + 72 hours;

    bool public openForWithdraw = false;

    event Stake(address indexed sender, uint256 amount);

    constructor(address exampleExternalContractAddress) {
        exampleExternalContract = ExampleExternalContract(exampleExternalContractAddress);
    }

    modifier notCompleted() {
        require(!exampleExternalContract.completed(), "Staking process already completed");
        _;
    }

    // HÀM 1: STAKE
    function stake() public payable {
        require(block.timestamp < deadline, "Deadline has passed");
        require(msg.value > 0, "You need to stake some ETH");

        balances[msg.sender] += msg.value;
        emit Stake(msg.sender, msg.value);
    }

    // HÀM 2: EXECUTE
    function execute() public notCompleted {
        require(block.timestamp >= deadline, "Deadline has not passed yet");

        if (address(this).balance >= threshold) {
            exampleExternalContract.complete{value: address(this).balance}();
        } else {
            openForWithdraw = true;
        }
    }

    // HÀM 3: WITHDRAW
    function withdraw() public notCompleted {
        require(openForWithdraw, "Withdrawals are not open");
        
        uint256 userBalance = balances[msg.sender];
        require(userBalance > 0, "You have no balance to withdraw");

        balances[msg.sender] = 0;

        (bool sent, ) = msg.sender.call{value: userBalance}("");
        require(sent, "Failed to send Ether");
    }

    // HÀM 4: TIMELEFT
    function timeLeft() public view returns (uint256) {
        if (block.timestamp >= deadline) {
            return 0;
        }
        return deadline - block.timestamp;
    }

    // HÀM 5: RECEIVE
    receive() external payable {
        stake();
    }
}