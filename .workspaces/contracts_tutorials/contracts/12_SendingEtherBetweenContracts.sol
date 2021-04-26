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
    ContractA private contractAInstance;
  //  constructor()public
    //{
        //contractAInstance=new ContractA();
    //}
   
    function setAddressofContractA(address payable _address)public //Settting the address of contract A at time of deployment
    {
        contractAInstance=ContractA(_address);
    }
    
    function getBalanceContractB()public view returns(uint) //seeing getBalanceContractB
    {
        return(address(this).balance);
    }
    
    function callgetBalanceContractA()external view returns(uint) //Calling getBalanceContractA
    {
        return (contractAInstance.getBalanceContractA());
    }
    
    function() external payable
    {
        address(contractAInstance).transfer(msg.value); //Sending money to contract A
    }
}