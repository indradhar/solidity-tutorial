pragma solidity ^0.5.0;
contract Array
{
    uint [] arr;
    function addElement()public returns(uint[] memory)
    {
        arr.push(10);
        arr.push(20);
        arr.push(30);
        delete arr[1];
        
        return arr;
    }
    
    function dynamicArray(uint a)public pure returns(uint[] memory)
    {
        uint[] memory arr1=new uint[] (a); //whenever we are using dynamic something; We should mention either memory or storage
        arr1[0]=1;
        arr1[1]=2;
        return arr1;
    }
}