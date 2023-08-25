// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract My_First_Token {
    string public myTokenName;  // Updated state variable name
    string public myTokenSymbol;  // Updated state variable name
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    address public contractOwner;

    modifier onlyOwner() {
        require(msg.sender == contractOwner, "Only the owner can call this function");
        _;
    }

    constructor() {
        myTokenName = "My First Custom Token";  // Updated state variable name
        myTokenSymbol = "MCT";  // Updated state variable name
        totalSupply = 9898;
        contractOwner = msg.sender;
    }

    function issueTokens(address user, uint256 amount) public onlyOwner {
        totalSupply += amount;
        balanceOf[user] += amount;
    }

    function destroyTokens(uint256 amount) public {
        if (balanceOf[msg.sender] >= amount) {
            totalSupply -= amount;
            balanceOf[msg.sender] -= amount;
        }
    }

    function executeTransfer(address to, uint256 amount) public {
        require(to != address(0), "ERC20: transfer to the zero address");
        require(balanceOf[msg.sender] >= amount, "ERC20: transfer amount exceeds balance");

        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
    }
}
