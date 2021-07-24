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
    // Driver driver = new Driver();
    
    uint min_amount = 23;
    
    location l1;
    ride r1;
    
    address private owner;
    
    
    // CONSTRUCTOR
    // constructor(Driver _driver)
    constructor() public
    {   
        owner=msg.sender;
        // driver = Driver(_driver);
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
    
    
    function updateHistory() internal {
        
        // history.push(l1);
        customerHistory[msg.sender].push(l1);
    }

    function requestRide(position calldata _pickup, position calldata _drop) public{
        r1.name = mapData[msg.sender].name;  
        // r1.customer = msg.sender;
        r1.pickup = _pickup;
        r1.drop = _drop;
        r1.isInRequestState = true;
        // array.push(r1)
        // activeRides.push(r1);
        customerCurrentRide[msg.sender] = r1;
       false".push(msg.sender);
        emit RequestedRide(r1);
    }

    // DYNAMIC ARRAY OF CUSTOMER RIDES -> CUSTOMER
    function viewCompletedRideRequest(uint acceptedCustomerIndex, address _driver, details calldata _driverInfo) public
    {
        // mapData[msg.sender], accessible
        r1 = customerCurrentRide[msg.sender];
        r1.isInRequestState = false;
        emit ViewAccrptedRide(r1, _driver, _driverInfo);
        // delete activeRides[rideIndex];
        delete customerCurrentRide[msg.sender];
        delete requestingCustomers[acceptedCustomerIndex];
    }

    // function rateDriver()
}
