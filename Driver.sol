pragma solidity ^0.8.0;

import "./User.sol";

contract Driver is User{
    
    struct details{
        int rating;
        int numRatings;
        bool isAvailable; // false - unavailable, true - available
        string licenseNo;
        int vehicleType; // no of seats
        int experience; // years
        // rest to be filled later
    }
    
    mapping(address => details) public driverDetails;
    // bool acceptRide;

    event AcceptedRide(string name, position pickup, position drop, details info);

    function getRide(string calldata _name,position calldata _pickup, position calldata _drop, bool _accept) public payable
    {
        if (_accept == true)
        {
            driverDetails[msg.sender].isAvailable = false;
            emit AcceptedRide(_name,_pickup,_drop,driverDetails[msg.sender]);
        }
    }
    // if structure members aren't accessible, pass explicitly
    
}