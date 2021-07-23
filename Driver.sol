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
        string vehicleModel;
        int experience; // years
        // rest to be filled later
    }
    
    mapping(address => details) public driverDetails;
    // bool acceptRide;

    event ShowAvailability(bool isAvailable);

    // event AcceptedRide(string name, position pickup, position drop, details info);
    event AcceptedRide(ride r, details info);

    event ShowCurrentRides(ride[] r);

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

    // if structure members aren't accessible, pass explicitly

    function getCurrentRides() public{
        // emit ShowCurrentRide(customerCurrentRide[_customer]);
        uint l = requestingCustomers.length;
        // ride[] rideList;
        for(uint i=0;i<l;i++)
        {
            rideList.push(customerCurrentRide[requestingCustomers[i]]);
        }
        emit ShowCurrentRides(rideList);
        // delete rideList;
    }

    function getRide(ride calldata _r,bool _accept) public
    {
        if(_accept == true){
            driverDetails[msg.sender].isAvailable = false;
            emit AcceptedRide(_r, driverDetails[msg.sender]);
        }
    }
    
    function makeAvailable() public{
        driverDetails[msg.sender].isAvailable = true;
    }
}