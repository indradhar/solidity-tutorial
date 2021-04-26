pragma solidity ^0.5.0;
library SafeMath 
{ 
        // Only relevant functions 
        function sub(uint256 a, uint256 b) internal pure returns (uint256) 
        {
            //assert(b <= a); 
            //return (a — b); 
        }
     
        function add(uint256 a, uint256 b) internal pure returns (uint256) 
        {
            uint256 c = a + b; 
            assert(c >= a); 
            return c; 
        }
}
    
    
contract Code_for_erc
{
    string public constant name = "DEFI_Insur";
    string public constant symbol = "DEFII";
    uint8 public constant decimals = 2;
    
    
    using SafeMath for uint256;
    uint256 totalSupply_ = 569 ether;
    
    mapping(address => uint256) balances; 
    mapping(address => mapping (address => uint256)) allowed;
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    
    
    constructor(uint256 total) public 
    {
        totalSupply_ = total;
        balances[msg.sender] = totalSupply_;
    }
    
    function totalSupply() public view returns (uint256) 
    {
        return totalSupply_;
    }

    address public contract_address;
    function getAddress()public
    {
        contract_address=address(this);
    }
 
    function balanceOf(address tokenOwner) public view returns (uint) 
    {
    return balances[tokenOwner];
    }
    
    function approve(address delegate, uint numTokens) public returns (bool) 
    {
    allowed[msg.sender][delegate] = numTokens;
    emit Approval(msg.sender, delegate, numTokens);
    return true;
    }
    
    function allowance(address owner,address delegate) public view returns (uint) 
    {
        return allowed[owner][delegate];
    }
    
    function transfer(address receiver,uint numTokens) public returns (bool) 
    {
        require(numTokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(numTokens); 
        balances[receiver] = balances[receiver].add(numTokens);
        // balances[msg.sender] = balances[msg.sender] — numTokens;
        // balances[receiver] = balances[receiver] + numTokens;
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }
    
    function transferFrom(address owner, address buyer,uint numTokens) public  returns (bool) 
    {
    require(numTokens <= balances[owner]);
    require(numTokens <= allowed[owner][msg.sender]);
    balances[owner] = balances[owner].sub(numTokens);
    allowed[owner][msg.sender] = allowed[owner][msg.sender].sub(numTokens);
    balances[buyer] = balances[buyer].add(numTokens);
    emit Transfer(owner, buyer, numTokens);
    return true;
    }
    
}