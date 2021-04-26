pragma solidity ^0.5.0;
contract ContractA
{
    function() external payable
    {
        
    }
    
    function getBalanceContractA()external view returns(uint)
    {
        return(address(this).balance);
    }
}

contract ContractB
{
    
    function() external payable
    {
        
    }
    
    ContractA private contractAInstance;
    constructor()public
    {
        contractAInstance=new ContractA();
    }
    
    //NOTE: We cannot check the balance of another contract with the help of constructor; 
    //Because it will allocate the instance variable a new memoryy address
    //Inorder to do that we need to provide address of contractA by setter method at deployement time
    function getBalanceContractB()public view returns(uint)
    {
        return(address(this).balance);
    }
    
    function callgetBalanceContractA()external view returns(uint)
    {
        return (contractAInstance.getBalanceContractA());
    }
}