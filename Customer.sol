pragma solidity ^0.4.17;

import "./User.sol";

contract Customer is User {
    
    struct location {
        
        //position pickup,drop;
        
    }
    
    location[] history;
    
    mapping(address => location[]) public Customer_history;
    
    address private owner;
  
     constructor() public{   
        owner=msg.sender;
    }
    
    function getOwner() public view returns (address) {    
        return owner;
    }
  
    function getBalance() public view returns(uint256){
        return owner.balance;
    }
    
    uint current_balance = getBalance();
    uint min_amount = 23;
    require( current_balance <= min_amount);

    location l1;
    
    function getpickup(fixed latitude, fixed longitude) internal {
        
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