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

    mapping(address => userData) mapData;
    
}