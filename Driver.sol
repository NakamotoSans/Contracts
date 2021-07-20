pragma solidity ^0.8.0;

import "./User.sol";

contract Driver is User{
    
    struct details{
        userData driver;
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

    event ShowAvailability(bool isAvailable);

    event AcceptedRide(string name, position pickup, position drop, details info);


    function setDriverDetails(string calldata _licenseNo, int _vehicleType, int _experience) public
    {
        driverDetails[msg.sender].licenseNo = _licenseNo;
        driverDetails[msg.sender].vehicleType = _vehicleType; 
        driverDetails[msg.sender].experience = _experience;
        driverDetails[msg.sender].isAvailable = true;
    }


    function getAvailability() public
    {
        emit ShowAvailability(driverDetails[msg.sender].isAvailable);
    }

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