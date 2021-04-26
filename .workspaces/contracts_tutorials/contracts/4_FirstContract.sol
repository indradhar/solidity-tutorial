pragma solidity ^0.5.0;

//pure: deals with local values and parameters
//View: cannot change the state variable value. and if deals with not private variables
contract MyContract
{
    int pri_a=10;
    int public pub_b=20;
    
    function getData() private pure returns(string memory) 
    {
        return "Hey";
    }
    
    function getInt() private pure returns(int) 
    {
        int8 a=10;
        return a; // returns a local variable so declared as pure
    }
    
    function getInteger(int a,int b) private pure returns(int,int) 
    {
        return (a,b);
    }
    
    function getData1() public pure returns(int,int)
    {
        return (getInteger(5,6));
    }
    
    function setVal() public view returns(int)
    {
       // pub_b++;//cannot change the state variable if we use view.  //If we want to modify then donot declare as view
        return pub_b+2;
    }
    
}