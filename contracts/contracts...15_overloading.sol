pragma solidity ^0.5.0;

contract Overloading
{
    function add(int a)pure public returns (int)
    {
        return(a+a);
    }
    function add(int a,int b)pure public returns (int)
    {
        return(a+b);
    }
    function add(int a,int b,int c)pure public returns (int)
    {
        return(a+b+c);
    }
}