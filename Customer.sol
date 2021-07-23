pragma solidity ^0.8.0;

import "./User.sol";
import "./Driver.sol";

contract Customer is User,Driver 
{
    // STRUCTS AND MAPS
    
    struct location
    {
        
        position pickup;
        position drop;
        
    }
    mapping(address => location[]) public customerHistory;
    
    
    // STATE VARIABLES
    Driver driver = new Driver();
    
    uint min_amount = 23;
    
    location l1;
    ride r1;
    
    address private owner;
    
    
    // CONSTRUCTOR

    constructor(Driver _driver) public
    {   
        owner=msg.sender;
        driver = Driver(_driver);
    }

    // EVENTS
    // event RequestedRide(string name, address customer, position pickup, position drop);
    event RequestedRide(ride r);
    event ViewAccrptedRide(ride r, address driver, details driverInfo);

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

    
    // function setPickup(int latitude, int longitude) public {
        
    //     l1.pickup.latitude = latitude;
    //     l1.pickup.longitude = longitude;
    // }
    
    // function setDrop(int latitude, int longitude) internal {
        
    //     l1.drop.latitude = latitude;
    //     l1.drop.longitude = longitude;
        
    // }
    
    function updateHistory() internal {
        
        // history.push(l1);
        customerHistory[msg.sender].push(l1);
    }
    // function completeTxn() -> use modifier for min bal
    // function requestRide() public {
    //     // if txn complete 
    //     r1.name = mapData[msg.sender].name;
    //     // emit RequestedRide(mapData[msg.sender].name, msg.sender, l1.pickup, l1.drop);
    //     // if structure members aren't accessible pass explicitly
    //     // emit RequestedRide(mapData[msg.sender].name, l1.pickup.latitude, l1.pickup.longitude, l1.drop.latitude, l1.drop.longitude);
    // }

    function requestRide(position calldata _pickup, position calldata _drop) public{
        r1.name = mapData[msg.sender].name;  
        r1.customer = msg.sender;
        r1.pickup = _pickup;
        r1.drop = _drop;
        r1.isInRequestState = true;
        emit RequestedRide(r1);
    }

    function viewCompletedRideRequest(ride calldata _r, address _driver, details calldata _driverInfo) public
    {
        // mapData[msg.sender], accessible
        r1.isInRequestState = false;
        emit ViewAccrptedRide(_r, _driver, _driverInfo);
    }

}
