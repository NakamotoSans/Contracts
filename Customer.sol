pragma solidity ^0.8.0;

import "./User.sol";
import "./Driver.sol";

contract Customer is User 
{

    // STATE VARIABLES
    Driver driver;
    
    uint min_amount = 23;
    
    location l1;
    
    address private owner;

    

    // STRUCTS AND MAPS
    
    struct location
    {
        
        position pickup;
        position drop;
        
    }
    mapping(address => location[]) public customerHistory;
    
    // CONSTRUCTOR

    constructor(Driver _driver) public
    {   
        owner=msg.sender;
        driver = Driver(_driver);
    }

    // EVENTS
    event RequestedRide(string name, position pickup, position drop);

    // MODIFIERS AND FUNCTIONS

    modifier minBalance()
    {
        require(msg.sender.balance >= min_amount);
        _;
    }
    // make modifier for user type
    modifier isCustomer()
    {
        require(mapData[msg.sender].userType == false);
        _;
    }
    
    
    // function getOwner() public view returns (address) 
    // {    
    //     return owner;
    // }
  
    // function getBalance() public view returns(uint256){
    //     return msg.sender.balance;
    // }
    
    // uint current_balance = getBalance();
    // require( current_balance <= min_amount);

    
    function getPickup(int latitude, int longitude) public {
        
        l1.pickup.latitude = latitude;
        l1.pickup.longitude = longitude;
    }
    
    function getDrop(int latitude, int longitude) internal {
        
        l1.drop.latitude = latitude;
        l1.drop.longitude = longitude;
        
    }
    
    function updateHistory() internal {
        
        // history.push(l1);
        customerHistory[msg.sender].push(l1);
    }
    // function completeTxn() -> use modifier for min bal
    function requestRide() public {
        // if txn complete 
        emit RequestedRide(mapData[msg.sender].name, l1.pickup, l1.drop);
        // if structure members aren't accessible pass explicitly
        // emit RequestedRide(mapData[msg.sender].name, l1.pickup.latitude, l1.pickup.longitude, l1.drop.latitude, l1.drop.longitude);
    }
}