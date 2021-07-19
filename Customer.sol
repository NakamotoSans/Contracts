pragma solidity ^0.4.17;

import "./User.sol";

contract Customer is User {
    
    uint min_amount = 23;
    
    
    struct location {
        
        position pickup,drop;
        
    }
    
    location[] history;
    
    mapping(address => location[]) public Customer_history;

    modifier minBalance()
    {
        require(msg.sender.balance >= min_amount);
        _;
    }
    
    address private owner;
  
     constructor() public{   
        owner=msg.sender;
    }
    
    function getOwner() public view returns (address) {    
        return owner;
    }
  
    // function getBalance() public view returns(uint256){
    //     return msg.sender.balance;
    }
    
    // uint current_balance = getBalance();
    // require( current_balance <= min_amount);

    location l1;
    
    function getpickup(fixed latitude, fixed longitude) internal minBalance {
        
        l1.pickup.latitude = latitude;
        l1.pickup.longitude = longitude;
    }
    
    function getdrop(fixed latitude, fixed longitude) internal {
        
        l1.drop.latitude = latitude;
        l1.drop.longitude = longitude;
        
    }
    
    function up_history() internal {
        
        history.push(l1.pickup,l1.push);
        
    }
    
}