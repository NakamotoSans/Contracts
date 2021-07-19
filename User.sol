pragma solidity ^0.4.17;

contract User {
    
    string private user_name;
    string private bio_data;
    ufixed private balance;
    bool user_type;                     //0 for customer and 1 for driver

    struct position{
        fixed latitude,longitude;
    }
    
}