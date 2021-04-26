pragma solidity ^0.5.0;
contract ContractA
{
    address AddressB;//storing address of contractB
    function setAddressB(address _address)external  //At the time of deployment we will provide address of contract b to setAddress method
    {
        AddressB=_address;
    }
    
    address contractInterface; //Similarly we are providing address of another contract which is implementing an interface
    function setAddressInterface(address _address)external
    {
        contractInterface=_address;
    }
    
    function sayHelloB()external view returns(string memory) //This function is calling a function in another contract 
    {
        ContractB contractb=ContractB(AddressB);
        return(contractb.sayHello());
    }
    
    function sayHelloInterface()external view returns(string memory) // this function is calling a function in an interface
    {
        InterfaceA interfaceA=InterfaceA(contractInterface); //We are providing the address of the contract which is implementing the interface
        return(interfaceA.sayHello()); //function in an interface is being called here
    }
}



/*           
  //    //       //
 //    //       //
//    //       //

This is Another contract
Another Contract Starts Here

  //    //       //
 //    //       //
//    //       //
*/
contract ContractB
{
    function sayHello()external pure returns(string memory)
    {
        return("Hello: Contract");
    }
}



/*           
  //    //       //
 //    //       //
//    //       //

This is Another contract
Another Contract Starts Here

  //    //       //
 //    //       //
//    //       //
*/


interface InterfaceA
{
    function sayHello()external pure returns(string memory);
}

contract ContractInterface is InterfaceA //This contract is implementing the InterfaceA
{
    function sayHello()external pure returns(string memory)
    {
        return("Hello: Interface");
    }
}