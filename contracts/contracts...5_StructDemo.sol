pragma solidity ^0.5.0;
contract StructContract
{
    struct student
    {
        uint roll;
        string name;
    }
    
    student s1;
    student s2=student(1,"indra");
    
    function sets1() public
    {
        s1=student(2,"jcruxx");
    }
    function gets1()public view returns(uint,string memory)
    {
        return(s1.roll,s1.name);
    }
}