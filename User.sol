pragma solidity ^0.8.0;

contract User {
    
    struct userData
    {
        string name;
        string bioData;
        // ufixed private balance;
        bool userType;                     //false for customer and true for driver
    }

    struct position{
        int latitude;
        int longitude;
    }

    struct ride{
        // userData user;
        string name; // customer name
        address customer;
        position pickup;
        position drop;
        bool isInRequestState;
    }

    mapping(address => userData) mapData;
    
    event DisplayUserData(userData u);

    // DAO, DTO

    function getUserData() public
    {
        emit DisplayUserData(mapData[msg.sender]);
    }

    function setUserData(userData calldata _u) public
    {
        mapData[msg.sender] = _u;
        // if direct initializing doesn't work, initialize individual members
    }
}