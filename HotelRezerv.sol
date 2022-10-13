//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract Hotelz{
    struct Customer {
        address _address;
        string _mail;
        uint _room;
        uint _days;
    }
    address public reciever = 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB;
    uint public price;
    uint public rom;
    constructor() {
    }
    mapping(address => Customer) customers;

    function TakeInfo(string memory mail,uint _room,uint _days) public {
        customers[msg.sender] = Customer(msg.sender,mail,_room,_days);
        price=customers[msg.sender]._days*customers[msg.sender]._room;
        rom = customers[msg.sender]._room;
    }
    
    function getCustomerInfos(address _address) public view returns (uint, uint, string memory) {
        string memory _mail = customers[_address]._mail;
        uint room = customers[_address]._room;
        uint _dayz = customers[_address]._days;
        return (_dayz, room, _mail);
    }
    function Pay() external payable{
        if (rom==1){
            price *= 1;
            (bool sent, )=reciever.call{value: price }("");
            require(sent,"call failed.");
        }
        else if (rom==2){
            price*=2;
            (bool sent, )=reciever.call{value: price}("");
            require(sent,"call failed.");
        }
    }
}
